Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCDFC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8PtkiJGxBUyS3CSiS4NRLX78ryNQkH/2aRc/twFMBA=; b=4kau1Y/1GZvkwy
	mV5SG6Qd9e/0zJhEmE5zcctdLbKzEo70GWydxQV7IdvjUjcWoznsx7fj5izQHeO9yVNwxf3MAz24w
	BTr+EExU1KLEfugBeZgc2cM7JN94o73ZzA3h8JY5eJ2gspunsT66PN6COyK3FpO5UNvxvZxmcxOfM
	FBJXgo3favoDeG0ZyIbKYxXqrKCY/Ro0tKIAQftyCZf0ohfz+WA66TIZeiGwoDDN4WIEo0oXmfrdn
	DGQOCdHBE9WtwO1mWu40Z6CO418cud4POlqBBDXlChO0bS9jv39KZIV8BQlb21zY5DLBd3TkAn30o
	tZOw4sRpzR3zgPpjg+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seTAt-000000096bN-19E0;
	Thu, 15 Aug 2024 05:37:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seTAp-000000096aF-3HyG
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 05:37:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso564325e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723700242; x=1724305042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjDe8SKONaZURgHZA5c05VUPeOQmcnfH8fj79hTPUW0=;
        b=B9DFfUjvGS5JfaAOvpl336VzzP/KAPuNtJkmnt2jJM7dmQq5qz1kXy/7UGQe6ILh4u
         GyBnhJDAuV9ify67EwzNJS9acNkzYwy3a2l/p6li4HX06JSCPwozce+KeSbtkIWkznCv
         izpPDI6VT/PJNCk6vuTr35I++NUn44c1PFHIPVeWHr2m5b5xv/nrVFGsZhJb5rKwpSLR
         jHMXJnXmidND8H2A6iNDmJWRhEtafH3rpOVrm3CASdGrFCNnl3+T5ZPQJpfr7dVrymVI
         MMiqh5nNAWYo2CPb5Hits4pDMRDjtVc/RvRop55WyrkyfSA/Q2H3sSCU3uX/EV0cuami
         YhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723700242; x=1724305042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjDe8SKONaZURgHZA5c05VUPeOQmcnfH8fj79hTPUW0=;
        b=nY5oQaW2CSHl6AVkUvjpGkeKEPnUDarM/3U4RES6NNq/jS7ocqFjSk6qUd0fgIIH+b
         +SQIRsJF3KiIG2mHlP6IJJDu2OC5LMyUqDJ0s9+vDv5PtOC5kU/sX4NZuDF+p4gxL7ur
         YNZmrESupgcX88BMi+TUxh4JFLc79sHb8HzbTv5n/Joz7WoWTP3W+liBMZwCITLK7+/3
         DKGGn+AUEvDeIsvIUrteSsayjsUWN93CyPB+DhON6jRk82aNfuX+pXrgW5fq6wUT26Ff
         4kuPGDQqQcFuFFXwO/KP8O/W6EZ1N/uNFK71A9BV1mW3v5m9jU6KyzaPo1WYt9yYYLZN
         FBJg==
X-Forwarded-Encrypted: i=1; AJvYcCUiN/GxrGTIadmSsOiQ7K7pQLQRDheAykA07SkY/lsGqfmww1eTvlHvbxJxv2NelYg8l89YBI4gTmS2zJweytbp9e/wyCWJxf7VsY3tQZMC
X-Gm-Message-State: AOJu0Yz3mCRVsmI6Lkklv/X24dcQg8NHlm99aPBNSmFKbeduFN7/Ys6h
	i9dIIDKdI/xr5Za3Rc9HhrGgmHHzfwIfDNaEhuBlVwJ61CLv/wgc68u/gAWS/ZDR4QX+m9uhe98
	90H15sf87n2d2QMsXFwsfZcN//JRDSEFgezpFqw==
X-Google-Smtp-Source: AGHT+IF9jSmbdeVwCB79GtR9SDoJ+2bWHoYxzLqNWum1tI3hIQtH6XZiiN6rGlSnsekomXl3LrE9gKaymssMicPa+1U=
X-Received: by 2002:a05:6512:3b0d:b0:530:ac6e:ea2f with SMTP id
 2adb3069b0e04-532edbacfb7mr2890845e87.37.1723700241540; Wed, 14 Aug 2024
 22:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240625030502.68988-1-cuiyunhui@bytedance.com>
 <CAEEQ3wnrdRcBdevQDGQ-5dr3aO1ura13_VskMYm8ySTZJTiYhw@mail.gmail.com> <CAEEQ3wkFk1bxEPH38yBH8wzAGhMB296B8knjx8nFKQYgrACSDg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkFk1bxEPH38yBH8wzAGhMB296B8knjx8nFKQYgrACSDg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 15 Aug 2024 07:37:09 +0200
Message-ID: <CAHVXubhWck7WS4CHByw1Y6zpN_+K41TmQ=xa7c_3+xo_se+HaA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Randomize lower bits of stack address
To: yunhui cui <cuiyunhui@bytedance.com>, Kees Cook <keescook@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, conor.dooley@microchip.com, bjorn@rivosinc.com, 
	sorear@fastmail.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_223723_873433_CBE75956 
X-CRM114-Status: GOOD (  21.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWXVuaHVpLAoKT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNDowOOKAr0FNIHl1bmh1aSBjdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEEgZ2VudGxlIHBpbmcsIEFueSBt
b3JlIGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2g/CgpJJ20gYWRkaW5nIEBLZWVzIENvb2sgIGluIGNj
IGluIGNhc2UgaGUgaGFzIGFueS4KClRoYW5rcywKCkFsZXgKCj4KPiBPbiBUaHUsIEp1bCAxMSwg
MjAyNCBhdCAyOjA54oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdy
b3RlOgo+ID4KPiA+IEFkZCBwdW5pdCBpbiB0aGUgbG9vcC4KPiA+Cj4gPgo+ID4gT24gVHVlLCBK
dW4gMjUsIDIwMjQgYXQgMTE6MDXigK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEltcGxlbWVudCBhcmNoX2FsaWduX3N0YWNrKCkgdG8g
cmFuZG9taXplIHRoZSBsb3dlciBiaXRzCj4gPiA+IG9mIHRoZSBzdGFjayBhZGRyZXNzLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaCB8IDggKysr
KysrKysKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgIHwgOSArKysrKysrKysK
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXhlYy5oCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZXhlYy5oCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMDdkOTk0MjY4MmUwCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9leGVjLmgKPiA+ID4gQEAgLTAsMCArMSw4IEBACj4gPiA+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiA+ICsKPiA+ID4g
KyNpZm5kZWYgX19BU01fRVhFQ19ICj4gPiA+ICsjZGVmaW5lIF9fQVNNX0VYRUNfSAo+ID4gPiAr
Cj4gPiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBhcmNoX2FsaWduX3N0YWNrKHVuc2lnbmVkIGxv
bmcgc3ApOwo+ID4gPiArCj4gPiA+ICsjZW5kaWYgLyogX19BU01fRVhFQ19IICovCj4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9jZXNzLmMKPiA+ID4gaW5kZXggZTRiYzYxYzRlNThhLi5lMzE0MmQ4YTZlMjggMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+ID4gQEAgLTE1LDYgKzE1LDcgQEAKPiA+ID4gICNp
bmNsdWRlIDxsaW51eC90aWNrLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+Cj4g
PiA+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3Bl
cnNvbmFsaXR5Lmg+Cj4gPiA+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL3VuaXN0ZC5oPgo+ID4gPiAg
I2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiA+ID4gQEAgLTI2LDYgKzI3LDcgQEAKPiA+ID4g
ICNpbmNsdWRlIDxhc20vY3B1aWRsZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4K
PiA+ID4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gPiArI2luY2x1ZGUgPGFzbS9l
eGVjLmg+Cj4gPiA+Cj4gPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfU1RBQ0tQUk9URUNUT1IpICYm
ICFkZWZpbmVkKENPTkZJR19TVEFDS1BST1RFQ1RPUl9QRVJfVEFTSykKPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9zdGFja3Byb3RlY3Rvci5oPgo+ID4gPiBAQCAtOTksNiArMTAxLDEzIEBAIHZvaWQg
c2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPiAgICAgICAgICAgICAgICAgZHVt
cF9iYWNrdHJhY2UocmVncywgTlVMTCwgS0VSTl9ERUZBVUxUKTsKPiA+ID4gIH0KPiA+ID4KPiA+
ID4gK3Vuc2lnbmVkIGxvbmcgYXJjaF9hbGlnbl9zdGFjayh1bnNpZ25lZCBsb25nIHNwKQo+ID4g
PiArewo+ID4gPiArICAgICAgIGlmICghKGN1cnJlbnQtPnBlcnNvbmFsaXR5ICYgQUREUl9OT19S
QU5ET01JWkUpICYmIHJhbmRvbWl6ZV92YV9zcGFjZSkKPiA+ID4gKyAgICAgICAgICAgICAgIHNw
IC09IGdldF9yYW5kb21fdTMyX2JlbG93KFBBR0VfU0laRSk7Cj4gPiA+ICsgICAgICAgcmV0dXJu
IHNwICYgfjB4ZjsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgI2lmZGVmIENPTkZJR19DT01QQVQK
PiA+ID4gIHN0YXRpYyBib29sIGNvbXBhdF9tb2RlX3N1cHBvcnRlZCBfX3JlYWRfbW9zdGx5Owo+
ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjIwLjEKPiA+ID4KPiA+Cj4gPiBUaGFua3MsCj4gPiBZdW5o
dWkKPgo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
