Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328D7C369AE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 04:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qU1OpkV9q73ZndeQkwnVheoCFCBTVAIz9xIIkdxcAwA=; b=AFMJNHHwBYgxND
	+rzyZ99htyI9TAhdqiyc+9V1AKiLNfLNGaMTLCReKd/wnCJrdssZsY53QgGEjZSG0UPpiYAnCxU9+
	1mzNtaaC7ihubTZIB81tasXrjAQe/Gs44pNKFn0hRKUPv38xDdDapeizYFMlswwez93XmyDGr3Pzl
	st8xTKTgF2UdqMF1wQuK0fqRogIbofHljZLferbN+5YY+Sm9Ogw4Aoi6MdbHspUV8peZp8rZtNWXJ
	7GFngiWjFRk/9xjTtyZefrjyGZXQrVFoWoAwM7b7fP0RhWJphzSf6bYi1H8Vq6J411wnPz/O1TyFd
	dxOnDOKc9PjLVpHZzdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3S3P-0000000FNSZ-1ezx;
	Sat, 12 Apr 2025 04:01:15 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3S3I-0000000FNRv-154j
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 04:01:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so3393512a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430466; x=1745035266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=b2WATELHx+QwPQgKVsXDeNen4l7EdRZq9NhZDzxNMd5oiTEHW4pk6Uj2hpLjKacmlC
         SvwB5Aon8V+TT8QGdKtXSJt4+tDWsHY15nOpQXQz1qOiaXrM0yp20DACJ0eioBdJAKL8
         XbhHFIY7ZSIr64F56BIapSdO7fKJdqLMatAWTPJMCfKdshdBxSt1NVw6+xbh6EOHUW7s
         30VdMFfwRYf1j6j14U1UWbXpoYkGpdVw82KXB2VvQCF0GmCynu0YNEIavxUH2azENUG4
         1W/Kt6b1vBwXa4b0AmZgnT6TfzxrMaWJ0aZvEJTmf3LnV5kwIFT7Ui7Wf6bYguMRi/TK
         U9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430466; x=1745035266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRPWfzlQeNRznSdwAcCFwL0YU/Q8vcd3a6wdTbE3VY=;
        b=DOfueQJr/wsNrmZB+VsteKE6b2RW/GoNKU2egN0ZqxlTCvyrsu86lKDyXfiSPb0aPZ
         uGCi6egFNn1jHr9f0jwnSUXuxJ/7/KFAOX4klkoKEc1XjN0GuJYzFxtdT4a73uruuTrY
         7YcRCm5L0ts7G+UYxPrzAP+43ath00NCoIMH+06o1RIk5fzOlYEtXm65S5MPm0UfmWUO
         KKuqvRy4arpuiKXt/0l9/WKM66siVwFdigCp/iBFA/QxAVAP5LTybSQXhKoMTMM5qrxW
         zbO1qdixPiSrpVblME7rRVhlpufmoLXfMbhxQ3NuHuzCmtMyYsaRS3HLRl6Iv0vHSevt
         vmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrD+RG9xq8L+6epTKR/Q0pTCouk9jh7CJCCCwEWuNvSXnO13bHFjmtfs9BlJTH2XHV1CgXulq28MSbIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmE05M/PakT4xIYc51iN3218Yk5kqBfnnQNyXUcgWu00CMInGd
	68jBqnPVSq62VVxJjdW19OmoQnjFnpODEET+yJlQoFJcNkk/zDkDBmqDqEo0YMBLONwdCUrsLTB
	GHPzYHS/4HwuSKUi9ARoqlbLke+08bNS3E9C4Hw==
X-Gm-Gg: ASbGncvy1kFq5gy1khfJQqdvx96Ir81GxWAZUPvpCaaoitN8vCMTPTXLpLVKQXI7SP4
	DYTenHokekaCtqYuJtqvgLsEuPJ/jMzoSvMcKRyHmR+Jre/euz9OjDozPylHXEZsszqW/HvrNMQ
	d5VhWZrjmiUNBKcPg2W69Xeg2FEw==
X-Google-Smtp-Source: AGHT+IENp9Rsn1tl1gtpbQVTMzSC6/93PX9bXuEoDkAlRHWwSvf7X/I+LUs0PiXsS9JvQ3CIAnw0CeEUzESATSMDzW8=
X-Received: by 2002:a17:907:c22:b0:ac1:e881:8997 with SMTP id
 a640c23a62f3a-acad3445eb0mr424260766b.3.1744430465564; Fri, 11 Apr 2025
 21:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-4-guodong@riscstar.com> <20250411-spoiler-dispatch-8f709700a996@spud>
In-Reply-To: <20250411-spoiler-dispatch-8f709700a996@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:00:53 +0800
X-Gm-Features: ATxdqUGgkB-PsMfv6YqmcddOd__4CXMlcvN5r0cbFMC6NhGoCTmz_wliYFT0jOQ
Message-ID: <CAH1PCMZcevte5kJ9PUO3cvoaFwdido=WboNcLV9dTk9SJuLGBQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to
 spacemit K1
To: Conor Dooley <conor@kernel.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_210108_565833_4BF3EFCB 
X-CRM114-Status: GOOD (  18.29  )
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

T24gU2F0LCBBcHIgMTIsIDIwMjUgYXQgMTI6NDPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMDk6MTQ6MTdQTSAr
MDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCAic3BhY2VtaXQsazEtcHdtIiBhcyBhIGNv
bXBhdGlibGUgc3RyaW5nIHRvIHN1cHBvcnQgdGhlIFBXTQo+ID4gY29udHJvbGxlciBvbiB0aGUg
U3BhY2VtaVQgSzEgcGxhdGZvcm0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8
Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sIHwgMSArCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdtLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sCj4gPiBpbmRl
eCA5NjQwZDRiNjI3YzIuLjFlM2NhYmY2YTg5YSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdtLnlhbWwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdtLnlh
bWwKPiA+IEBAIC0xOSw2ICsxOSw3IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgLSBtYXJ2ZWxs
LHB4YTI3MC1wd20KPiA+ICAgICAgICAtIG1hcnZlbGwscHhhMTY4LXB3bQo+ID4gICAgICAgIC0g
bWFydmVsbCxweGE5MTAtcHdtCj4gPiArICAgICAgLSBzcGFjZW1pdCxrMS1wd20KPgo+IFRoZSBk
cml2ZXIgZG9lc24ndCBhcHBlYXIgdG8gaGFuZGxlIHRoaXMgZGlmZmVyZW50bHkgdG8gZXhpc3Rp
bmcKPiBjb21wYXRpYmxlcywgd2h5IGlzIGEgZmFsbGJhY2sgbm90IHVzZWQ/Cj4KClRoZSBvbmx5
IGRpZmZlcmVuY2UgaW4gdGhlIFNwYWNlbWlUIEsxIFBXTSBjb250cm9sbGVyIGlzIHRoZSBhZGRp
dGlvbiBvZgphIHJlc2V0cyBsaW5lLiBUaGlzIHByb3BlcnR5IGlzIG5vdCB1c2VkIGJ5IGFueSBl
eGlzdGluZyBQWEEtYmFzZWQgcGxhdGZvcm1zLgoKU2luY2UgcmVzZXRzIGlzIGRlZmluZWQgYXMg
b3B0aW9uYWwsIEkgYWdyZWUgdGhhdCBjb250aW51aW5nIHRvIHVzZQp0aGUgZXhpc3RpbmcgbWFy
dmVsbCxweGEuLi4gY29tcGF0aWJsZSBzdHJpbmcgaXMgcmVhc29uYWJsZS4KCkknbGwgdXBkYXRl
IHRoZSBuZXh0IHZlcnNpb24gYWNjb3JkaW5nbHkgYW5kIGluY2x1ZGUgYW4gZXhwbGFuYXRpb24g
b2YgdGhpcwpkZWNpc2lvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgotR3VvZG9uZwoKPiA+Cj4g
PiAgICByZWc6Cj4gPiAgICAgICMgTGVuZ3RoIHNob3VsZCBiZSAweDEwCj4gPiAtLQo+ID4gMi40
My4wCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
