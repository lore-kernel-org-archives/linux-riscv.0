Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A0C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 05:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVKAfXjTORwusMmOZDnPBGbGq7YEd1FQWRJ/wrM6paU=; b=MDl8mzcAXc5UPm
	E4L/6/iaFQFPl+XzlmhvKdKu4aDzvU8vMvQmSFLddgPVL564lp0nRZFKzxMbQFgdxSxC+Jvsrg2Hh
	WiBq+hP9F/Od7DAS7MLWcAv72Zm0JAoBuplCndDGbeELLm51jGY9fHQnLYbdgddHH5Brapq42+cAq
	MYN5iWA85oYlW6qkiFiVieOVKbu++Uc8+DjO7W8n+JQEGlW6PoEX78rAzyYr9Jy2ypKDOVAcUnlu9
	YxjtILbnSkvVy3e1qYz78nTNrBAlflqiirRgjZNSncRmn76+wL6bi2rqjAEdrvnJ9Jibs3wQhYKu2
	4H6t+MAq99A0cJBuT7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv1z-00000009Ij9-1ErB;
	Fri, 31 May 2024 05:42:23 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv1w-00000009IiF-15Vp
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 05:42:21 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7e21b6e98bdso74055139f.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717134138; x=1717738938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O7d9Ggj1euHigzWUl/7tmCoiCMPOOy96o4IjkVfxbc=;
        b=KKDflaBIZt5dvvoWw/SmI3NoHog/lhS6/b3fEXLoDxi/9qYs5MyHiotgOa9lPBfeof
         IBxt6I+wFnDxqNkrcWyMKRV3xo2sUKFXj+FHFGftAEVNtGVJqtMkSGHhaw4h2mhaRoyO
         uYdO+1aMUL00hbUcCjo9QVjWamwBlhnFEBy0sQPYhYFEpW/fAaJhG63A5LtekKcC80ul
         HVV9nkrYp19bzWSKUeBX62rvHUW3amaBS87FgMx5hCY9Q0wuTQhha4nM4aNB0UoNC9Pi
         ETcKBmuYXCeA8bOzFd7Q5B0hij3RlCimn8ZHaVtqarxBzV+zRFQQTIaVdltQKCcWyqhn
         hJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717134138; x=1717738938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O7d9Ggj1euHigzWUl/7tmCoiCMPOOy96o4IjkVfxbc=;
        b=e2GZwcCfZHk+0bbyvV07lumRsZiPz/0MuDLOmSibu5mO4z5OoYX29EuG2KSrRahpQp
         cSmhukhNWE8z6VvafNP4WCDohwlIsjSZFwzhmlkzXobL9gXv2VtsA5uhemW2+Hyb9fv5
         04VnPP7ry+xmFnBNW66cBhzSsXPFP/JVA9rQwB7T9lKTKL/yNBoL3Kct4oPq/XFM1noj
         xE333Yo+h8GYxPLk+kEED00NPek4v5Py32FkebH4QuaP3mPvgzfRd/XiSRpHPGaOO4mo
         oF0ArvW9QOqQN6Wt29H7EpM17ac/lnBBalnbnIRGZBOE+Lb0F+IPHgSXeaaWAmNIE6+o
         rgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqEFGE39oiK7UiHfhHlibxwj0QJti1fy1PUBExLMyaoGLHDkNDqEQ/WQJCZ0RUlOqbhB82qrAaAWXSakvvI4enHR2ZfTZ9q6J+FH7Ly4TE
X-Gm-Message-State: AOJu0YwDkVzs1tQ5PUC7HubDNagUiTP/vLZcSmBu9+vN+158vkkSg3cw
	Ur1oYLfb8mHXlSaPQg4TXw6/0uorBSM+9NYtQkE/mdlRXVyMQCnpclDyzC9RFB9EhTY5BQR+Chv
	Sy44Y9HA/JlEop2Za49vX/WPA80tyLPf3p4f/rn4GP55WzEVm
X-Google-Smtp-Source: AGHT+IEtj9pGF5vtAyZZfL+KJ2BJbeEtCqJtl3SIrkwKxUBy8V/vzqXxMBy/vadTFe0iv23wkzuDXFNgfcG5jn+EYHg=
X-Received: by 2002:a05:6602:2c02:b0:7ea:cd68:d235 with SMTP id
 ca18e2360f4ac-7eafff45e66mr121858839f.18.1717134137673; Thu, 30 May 2024
 22:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
In-Reply-To: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 11:12:05 +0530
Message-ID: <CAAhSdy1Mjx5cq0Gim3TBFSCNbCJPvMxkRSC-gW6KjFeGBrg75w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix incorrect reg_subtype labels in
 kvm_riscv_vcpu_set_reg_isa_ext function
To: zhouquan@iscas.ac.cn
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_224220_493694_304E4F00 
X-CRM114-Status: GOOD (  16.15  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgNzo0M+KAr0FNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gSW4g
dGhlIGZ1bmN0aW9uIGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfaXNhX2V4dCwgdGhlIG9yaWdpbmFs
IGNvZGUKPiB1c2VkIGluY29ycmVjdCByZWdfc3VidHlwZSBsYWJlbHMgS1ZNX1JFR19SSVNDVl9T
QklfTVVMVElfRU4vRElTLgo+IFRoZXNlIGhhdmUgYmVlbiBjb3JyZWN0ZWQgdG8gS1ZNX1JFR19S
SVNDVl9JU0FfTVVMVElfRU4vRElTIHJlc3BlY3RpdmVseS4KPiBBbHRob3VnaCB0aGV5IGFyZSBu
dW1lcmljYWxseSBlcXVpdmFsZW50LCB0aGUgYWN0dWFsIHByb2Nlc3NpbmcKPiB3aWxsIG5vdCBy
ZXN1bHQgaW4gZXJyb3JzLCBidXQgaXQgbWF5IGxlYWQgdG8gYW1iaWd1b3VzIGNvZGUgc2VtYW50
aWNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjEwLXJjWCBmaXhlcy4KCkkgaGF2ZSBhZGRl
ZCBhbiBhcHByb3ByaWF0ZSBGaXhlcyB0YWcgYXMgd2VsbC4KClRoYW5rcywKQW51cAoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
aW5kZXggYzY3NjI3NWVhMGEwLi42Mjg3NGZiY2EyOWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMK
PiBAQCAtNzI0LDkgKzcyNCw5IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3JlZ19p
c2FfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIHN3aXRjaCAocmVnX3N1YnR5
cGUpIHsKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFOgo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gcmlzY3ZfdmNwdV9zZXRfaXNhX2V4dF9zaW5nbGUodmNwdSwgcmVnX251
bSwgcmVnX3ZhbCk7Cj4gLSAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfU0JJX01VTFRJX0VOOgo+
ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9NVUxUSV9FTjoKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJpc2N2X3ZjcHVfc2V0X2lzYV9leHRfbXVsdGkodmNwdSwgcmVnX251bSwgcmVn
X3ZhbCwgdHJ1ZSk7Cj4gLSAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfU0JJX01VTFRJX0RJUzoK
PiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfTVVMVElfRElTOgo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gcmlzY3ZfdmNwdV9zZXRfaXNhX2V4dF9tdWx0aSh2Y3B1LCByZWdfbnVtLCBy
ZWdfdmFsLCBmYWxzZSk7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT0VOVDsKPgo+IGJhc2UtY29tbWl0OiAyOWM3M2ZjNzk0YzgzNTA1MDY2ZWU2ZGI4OTNi
MmE4M2FjNWZhYzYzCj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
