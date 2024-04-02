Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68807CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 03:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51JS899mWWz+AUw2OeCH3tYREviyGEJgh7duKAqObjM=; b=cT7sPlTgMU82Ow
	3Qlh/eKSy+n77oSARXkh9p3txFWk92H39RnkYi3cD2tyM8OMG3KW5eXf0dJj/U/Ldt+RUEgdV6zYY
	HjHZed5cm9a9aiEbKYYaRnbPrbmqSkRvlDPXDZLaAyMB+xa3lxzHHUY3oGw0riBWAiPgU3r90nPG7
	VQR3B1+SMqs8DB3H3/gArczvTkJ/YbUYb3cnYZw2+n5LTaD1ejP02lwEqwfj3O75B0ecNfJXDY/Ao
	1U7FrWpmLAKblFpP7fbfrqxjQJpT2FTzF83hK/cD+sWTu6kts2Lym1l63s28zDutFqzOqJEqG09Bu
	gyolX1qSozG60K2CO5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrV8J-00000009bpo-0des;
	Tue, 02 Apr 2024 03:48:23 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrV8G-00000009bpL-0MZq
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 03:48:21 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-369ac58efa2so4708945ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1712029698; x=1712634498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRXP8PEDy6HBuySOmMSBHLD3rej3TEfmNESOFzF7VxM=;
        b=fB9tW/5y9xQ4tCSoO600n+e0/0gxRnULbmQi5FmA1cHeB1Srnx0X0sLXxgYeVGUk63
         vCD2Ti89xiQ6wkmWADxa0Lpf3MlnH/+K40YTKnppqn72hs0o9s2Cx/bK5IDHzx8+VMIB
         eqSr9TsMzzyTJPsj6iBdNxODtQB04JQ65IbceNKz0Un9thilJGtQ/4rwSUK+U7qndpNv
         mZ7nYZkYoF5i+N+kJAYGe/pORg19fBuZ99AuaCfi2lZi3wanmTfulV5ptuF+I0ULDyFT
         WMdPhFrOHXv6WkFA3krK9xo8x7FAJqq+TBYVZOZlaFMrb8Dzow0HS7deRCzpXZMiyBje
         IqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712029698; x=1712634498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRXP8PEDy6HBuySOmMSBHLD3rej3TEfmNESOFzF7VxM=;
        b=w2MqXZ2PUsOMyXCAh3PzcRCe2+shFS2xO68c+ZlhhVLceyI5hpTmk/F3bSeAj09R/n
         vYs8CtSeA4n/KtLH5mwYysD77FkLgOj/+tyv8y/1O9tXiiE+BfUxqNbwa/CyQxgpI1+3
         4jltwcUXzMUHFh2QZjxSOyUqVUYBpawHoSQrGeLNy50aNKAOQua2FL+LgWpjDK7KUAzF
         LIbwTnqfwirVGNJXedD6JJ6k5HqfC+j/p1qUav8Iq3fix9kBWnIs8DNpyyo7R9rb+sB7
         7nuCUwMz2OitHoyI6offewVZzo0qSKw1r2Aq+SAu3blyQ11SsUyalbEgJfeXU9TLt0gg
         H96g==
X-Gm-Message-State: AOJu0Yw5L3VMyrO86M+oELg1+5FTb7vtf3t0cNDgWoVmGlVhTk0ZTdGD
	Fov3wdPRw3yh1eRL2MPfR0F1gmTIBFxmA1/6GqqoM0duyKmQ+aLfMSfwXNEgHTAZAsLS0HCT6S2
	Vj91ionQBPRwbLq43IYrG+fdGr+uBT+KJeYN20Q==
X-Google-Smtp-Source: AGHT+IF1duoALxvuX8eHPfl9RZKHZIUXolYB8P0dgKvksS2q8ui5gKbpX3zdmcEpcaLgyqrviWZN37MNZIPjYy3xMFs=
X-Received: by 2002:a05:6e02:339b:b0:369:943c:d35 with SMTP id
 bn27-20020a056e02339b00b00369943c0d35mr6053675ilb.11.1712029697835; Mon, 01
 Apr 2024 20:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240326101054.13088-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240326101054.13088-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2024 09:18:06 +0530
Message-ID: <CAAhSdy1EOyzg+Sdx5-uJJqFipehde+zGic8jNnnTXBEj7k4P3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_204820_365391_52877113 
X-CRM114-Status: GOOD (  21.95  )
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMzo0MeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9sb2Nr
aW5nLnJzdCBhZHZpc2VzIHRoYXQga3ZtLT5sb2NrIHNob3VsZCBiZQo+IGFjcXVpcmVkIG91dHNp
ZGUgdmNwdS0+bXV0ZXggYW5kIGt2bS0+c3JjdS4gSG93ZXZlciwgd2hlbiBLVk0vUklTQy1WCj4g
aGFuZGxpbmcgU0JJX0VYVF9IU01fSEFSVF9TVEFSVCwgdGhlIGxvY2sgb3JkZXJpbmcgaXMgdmNw
dS0+bXV0ZXgsCj4ga3ZtLT5zcmN1IHRoZW4ga3ZtLT5sb2NrLgo+Cj4gQWx0aG91Z2ggdGhlIGxv
Y2tkZXAgY2hlY2tpbmcgbm8gbG9uZ2VyIGNvbXBsYWlucyBhYm91dCB0aGlzIGFmdGVyIGNvbW1p
dAo+IGYwZjQ0NzUyZjVmNiAoInJjdTogQW5ub3RhdGUgU1JDVSdzIHVwZGF0ZS1zaWRlIGxvY2tk
ZXAgZGVwZW5kZW5jaWVzIiksCj4gaXQncyBuZWNlc3NhcnkgdG8gcmVwbGFjZSBrdm0tPmxvY2sg
d2l0aCBhIG5ldyBkZWRpY2F0ZWQgbG9jayB0byBlbnN1cmUKPiBvbmx5IG9uZSBoYXJ0IGNhbiBl
eGVjdXRlIHRoZSBTQklfRVhUX0hTTV9IQVJUX1NUQVJUIGNhbGwgZm9yIHRoZSB0YXJnZXQKPiBo
YXJ0IHNpbXVsdGFuZW91c2x5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlv
bmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIHwgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDEg
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyAgICAgfCA1ICsrLS0tCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDQ4NGQwNGE5MmZhNi4uNTM3MDk5NDEzMzQ0IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC0yNTQsNiArMjU0LDcgQEAgc3RydWN0
IGt2bV92Y3B1X2FyY2ggewo+Cj4gICAgICAgICAvKiBWQ1BVIHBvd2VyLW9mZiBzdGF0ZSAqLwo+
ICAgICAgICAgYm9vbCBwb3dlcl9vZmY7Cj4gKyAgICAgICBzdHJ1Y3QgbXV0ZXggaHNtX3N0YXJ0
X2xvY2s7CgpJbnN0ZWFkIG9mIGEgbXV0ZXggaHNtX3N0YXJ0X2xvY2ssIGxldCdzIGludHJvZHVj
ZSBzcGlubG9jayBtcF9zdGF0ZV9sb2NrCndoaWNoIG5lZWRzIHRvIGJlIHRha2VuIHdoZW5ldmVy
IHBvd2VyX29mZiBpcyBhY2Nlc3NlZC4gQWxzbywgd2Ugc2hvdWxkCnJlbmFtZSAicG93ZXJfb2Zm
IiB0byAibXBfc3RhdGUiIHdpdGggdHdvIHBvc3NpYmxlIHZhbHVlcy4KCj4KPiAgICAgICAgIC8q
IERvbid0IHJ1biB0aGUgVkNQVSAoYmxvY2tlZCkgKi8KPiAgICAgICAgIGJvb2wgcGF1c2U7Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUu
Ywo+IGluZGV4IGI1Y2E5ZjJlOThhYy4uNGQ4OWI1YjVhZmJmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC0xMTks
NiArMTE5LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPiAgICAgICAgIHNwaW5fbG9ja19pbml0KCZ2Y3B1LT5hcmNoLmhmZW5jZV9sb2NrKTsKPgo+
ICAgICAgICAgLyogU2V0dXAgcmVzZXQgc3RhdGUgb2Ygc2hhZG93IFNTVEFUVVMgYW5kIEhTVEFU
VVMgQ1NScyAqLwo+ICsgICAgICAgbXV0ZXhfaW5pdCgmdmNwdS0+YXJjaC5oc21fc3RhcnRfbG9j
ayk7Cj4gICAgICAgICBjbnR4ID0gJnZjcHUtPmFyY2guZ3Vlc3RfcmVzZXRfY29udGV4dDsKPiAg
ICAgICAgIGNudHgtPnNzdGF0dXMgPSBTUl9TUFAgfCBTUl9TUElFOwo+ICAgICAgICAgY250eC0+
aHN0YXR1cyA9IDA7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKPiBpbmRleCA3ZGNhMGU5MzgxZDkuLmI1
MjhmNmU4ODBhZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4gQEAgLTcxLDE0ICs3MSwxMyBA
QCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X2hzbV9oYW5kbGVyKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgewo+ICAgICAgICAgaW50IHJldCA9IDA7Cj4gICAg
ICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjcCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRl
eHQ7Cj4gLSAgICAgICBzdHJ1Y3Qga3ZtICprdm0gPSB2Y3B1LT5rdm07Cj4gICAgICAgICB1bnNp
Z25lZCBsb25nIGZ1bmNpZCA9IGNwLT5hNjsKPgo+ICAgICAgICAgc3dpdGNoIChmdW5jaWQpIHsK
PiAgICAgICAgIGNhc2UgU0JJX0VYVF9IU01fSEFSVF9TVEFSVDoKPiAtICAgICAgICAgICAgICAg
bXV0ZXhfbG9jaygma3ZtLT5sb2NrKTsKPiArICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmdmNw
dS0+YXJjaC5oc21fc3RhcnRfbG9jayk7Cj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9zYmlf
aHNtX3ZjcHVfc3RhcnQodmNwdSk7Cj4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygma3Zt
LT5sb2NrKTsKPiArICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ2Y3B1LT5hcmNoLmhzbV9z
dGFydF9sb2NrKTsKClRoZSB1c2Ugb2Yga3ZtLT5sb2NrIG92ZXIgaGVyZSB3YXMgYWxzbyBwcm90
ZWN0aW5nCnNpbXVsdGFuZW91cyB1cGRhdGVzIHRvIFZDUFUgcmVzZXQgY29udGV4dC4gSXQncyBi
ZXR0ZXIKdG8gaW50cm9kdWNlIGEgc2VwYXJhdGUgbG9jayBmb3IgcHJvdGVjdGluZyBWQ1BVIHJl
c2V0CmNvbnRleHQgYWNjZXNzLgoKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBj
YXNlIFNCSV9FWFRfSFNNX0hBUlRfU1RPUDoKPiAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Ni
aV9oc21fdmNwdV9zdG9wKHZjcHUpOwo+IC0tCj4gMi4xNy4xCj4KCkkgdGhpbmsgdGhpcyBwYXRj
aCBjYW4gYmUgYnJva2VuIGRvd24gaW50byB0d28gcGF0Y2hlczoKMSkgUGF0Y2ggcmVwbGFjaW5n
IFZDUFUgInBvd2VyX29mZiIgd2l0aCAiZW51bSBtcF9zdGF0ZSIKICAgIGFuZCBpbnRyb2R1Y2lu
ZyAibXBfc3RhdGVfbG9jayIKMikgUGF0Y2ggaW50cm9kdWNpbmcgVkNQVSByZXNldCBjb250ZXh0
IGxvY2sKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
