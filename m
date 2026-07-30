Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C479C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0c6Po1Y85StDTXTvdKm+8xBJZKOTncRwynuGePXNTcA=; b=4ZUKcqERVmtwX9
	kW/DdKXPfEEteFb3kQ74mCe3v55xuDJuOHM+XZSFYmVmqYsLSIqeg1Gshch7Xjfip6w/4qgevP21K
	L9oJ61CtK+HU/KRyHwR/oEAPfz5dhyADH1KqG/XzGMcNDIj8Vc57MvzJMOR1DVoyqsCM1rNhl6faE
	zNtt0HYDOGC2ckp6YFZa80ZZcMPjLIBKZnlTMXGqhR0BzYn2fJAipikyh8p7Dp04dT+iEHArQj8Eb
	/sEEvSZ6CGhhW12RTxQ9N7hX9KTuwHwVrSA9E4rkvbEM5xvjbfnZqJeXovqN4DeDH3jzDuWg6XGvu
	S/naK6fQneWdUI6XA/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKS1-00000009dXg-2Zrz;
	Thu, 30 Jul 2026 06:41:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKRy-00000009dWy-468A
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:41:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47df43bfb07so656146f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393661; cv=none;
        d=google.com; s=arc-20260327;
        b=GYZpiXq4jp7G9FBe/86siIHDIH4raT5f9tvVKHcBWd4Aul4/8EFxITpjyn4UcmwvgO
         ug/2+XY8CQwtJLMnwET5NBzBGYxQLHP1ZCggG6ZpfPrfyf9M6U2lj7MZQqXwWDl1NBIH
         C3cdupHm/tijDQhfvtpMxNJ3GRbfEwDiw/urtNoCNY5GN9DxxmOSQWpEdoJP8UUd5M/e
         2aM5HOPgEojEL2Wh0mHujfgFuYalQ3XQhYB7NPOV7iCz9FNBdIJMrCoINw8xkKgQu+MH
         cw5d6E9j9FnfgfKxVxgmma+nAu71fRQk7ZsXELRM7Hw4N0AiOpSYf45j0srJeYOoXyxQ
         QY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        fh=g5AS9NiQ1uckPY6stBXj/zSlugxk5vNOzbCYaTU+9hg=;
        b=OL+HzsRou/cOd8/EzQecmQL79dkzTzc8IwGR/46kUjykknXjDC0htgQmdvSxDt6Vob
         UmJtYBaZtH6rOuTYk3R495PfPa1rcg6jCoimisb4xWIvb/vWtA6iWs5WF1hbQIO9Oppi
         jGKC0oMjj4X5ZNLenNpCuRZBlsYXHVJHSKaejHxTG1G/tafMb4SFve8Ovk6lER4DrKEh
         qzkQPyXKy3VNO7M0/U+MFtbZVNBG44YP3lRWmbUTn/wqzpIrchDyiyBbJr1B7OQQgS/G
         9TWRMwmuZY8k6O1MZ8LurRz2ZP1pC2Ycpc4QsDXCeUzCvLxzzBgrYzBiGGyHgxr375/L
         VggA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393661; x=1785998461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        b=FOn184AM6IpdtdKTRP4O+BPnOThhC9zx3YXyXWDdZxZhVMXaeyXwAJgmA/UUKkkKNp
         eY4QGzx8suhwOnJ1SRzA3DYMzETs7B1yBuwjitRZEc+fEZDHm+o1ywJ1slv++oZNi2qx
         RnTe+f0/JIPZvkF0Ab39Va0DFdNFG3Z9coCTOsY/v6UyDBVq/N8ETmDfZUcsUE5DRE3Q
         +zXdkG1u7aB0V+4uODIelXoDtb6qdPEDPtkxMJjl1+Afyq6QYtQGC+mVgkPA/ez6gLkT
         u4rkztkoKmzLyrpCTtWcwtmhpXDD/yR4E9jdS/6Lrzsocke4vJa/sib3Cf5RT2qONEIi
         HypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393661; x=1785998461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        b=je6OE0drMRypu1nqOKQ8QhwViOgqhCSNsIiSoLZ0fkrYUOGahyQqEovqxtOjUdD8Xc
         qatzXT5VKYMLR1GPqevMXuj3tECXrPbV0Jyc6yImVvQAOYabsm1rGfhNn9Dbox16PsGb
         eEGh+cu2AzjfQEr5B3LzmQOB9Y6kyqOmtm5WVGEYuAHmlIaOQos0V94AhH0uOUMqvEQT
         rSoI9RifJg7i94skTz5CXS9a7ha24OAPuNJCHF0uQZMVFQSqkQtyuGtdSnh2K5gjanYF
         gRwS/FWSOjSBSFLVQbRpOlJdY9c7XPe96Wy67nuiyWaGbhygAh7lrxPcaCtuW8xv+CVx
         8IlA==
X-Forwarded-Encrypted: i=1; AHgh+RqQYsiAwUVpsOft8SFsZkvVs2QAxydAIJA9ieB31zhjWVb/BdwRXV7ILahMtrF5nW9upRYGpJfy0O3+bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM7gI6NEWQQSAdvVw9GKsSn0f4hLcjdmnNTynR2bbmCn4lLYHW
	Kj1eu7vjxF8D3A8isysf9vyUMMZ0hAWHCgOUCMBwMHxaI30ell5y5ukGYpxzZCz/grRVsnjHb5p
	ERg4+blUHFBqk6R+olj+7Rp1jzlLmVg1PuPu+PU5SCg==
X-Gm-Gg: AR+sD12rIAJv4ccLdd6bSlQJhQ2Bf4xQNQXoUtjl+Q0IFmUBNAZE/lKdCQyC5rhMfN9
	YvfL3w0SjQ0EZHu8GfDpLUYnOzm8hcTiI5+Tiv6cOXy+86wtYczAdwghM5rkDEA8fEJVnwyKloA
	lA5TPJv4u1of2acDxpz1GMMAZgcHiqUhJUDxQQC/SI95hmTWVws2Nh7U4K+3q7QlrLD3I9Y+5ro
	H4HWhQMu6bK7L+fbZHgv3yiX5v3wDug654hVDxo0i1YRak9fg3LUXC5K3d/6R464k8Z0vpiNr51
	yAz8waPPioF0QK9TV6KQE2LSfqxswM1py+MTE5xhC8B9ZmSoDE3AV94gfnnQd1P5zl2Oy59VzHB
	jFge0V5qcp49cXwt/XuRN3mVUhmLJz6lc8FaFlMGyM7B2Y2ivFVRePw1psGFEU2g=
X-Received: by 2002:a5d:64e4:0:b0:47f:81fe:12fb with SMTP id
 ffacd0b85a97d-47fc82029fbmr1441430f8f.47.1785393660872; Wed, 29 Jul 2026
 23:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:10:49 +0530
X-Gm-Features: AUfX_mx-1OMiSrp_cztB7RBUzQgECxkWV-SuPzBeqXIqONCE7eUdTY36tN80PSc
Message-ID: <CAAhSdy3W5LQ_iKLgb6qLNSswgh1OOjgjyAizHZ751=yq7UQTkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] RISC-V: KVM: Cleanup SBI extension status when disable
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_234103_035661_DB10AFDC 
X-CRM114-Status: GOOD (  14.13  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgNDo1NeKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gS1ZNIFNCSSBGV0ZUIGV4dGVuc2lvbiBoYXMgbXVsdGlw
bGUgaW50ZXJuYWwgc3RhdGUgY2FuIGJlIHByb2dyYW1tZWQKPiBieSB0aGUgdXNlcnNwYWNlLiBI
b3dldmVyLCB3aGVuIHRoZSBGV0ZUIGZlYXR1cmUgb3IgdGhlIEZXRlQgZXh0ZW5zaW9uCj4gaXMg
ZGlzYWJsZWQsIHRoZSBpbnRlcm5hbCBzdGF0ZSB3aWxsIGJlIGtlcHQgYXMgaXQgaXMsIHdoaWNo
IG1heSBjYXVzZQo+IHNvbWUgc2lkZSBlZmZlY3QgZm9yIHRoZSB2Q1BVLCBjbGVhbnVwIHRoZXNl
IHN0YXRlIHdoZW4gYSBTQkkgZXh0ZW5zaW9uCj4gb3IgRldGVCBmZWF0dXJlIGlzIGRpc2FibGVk
Lgo+Cj4gQ2hhbmdlIGZyb20gdjI6Cj4gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAy
NjA3MDYwMjExNTQuMjEwMjg5LTEtaW5vY2hpYW1hQGdtYWlsLmNvbQo+IHBhdGNoIDEsIDI6Cj4g
MS4gQXBwbHkgQW51cCdzIHRhZy4KPiBwYXRjaCAzOgo+IDEuIFJlbW92ZSB0aGUgY3NyX2RpcnR5
IHNldC4KPiBwYXRjaCA0Ogo+IDEuIEFkZCBhIG5ldyBwYXRjaCB0aGF0IHNldHMgdGhlIGNzcl9k
aXJ0eSBmb3IgRldGVCBleHRlbnNpb24uCj4KPiBDaGFuZ2UgZnJvbSB2MToKPiAtIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2t2bS8yMDI2MDcwMTA5NDczMS4xMDIyMTYzLTEtaW5vY2hpYW1hQGdt
YWlsLmNvbQo+IHBhdGNoIDI6Cj4gMS4gQ2hlY2sgc3VwcG9ydCBjYWxsYmFjayBleGlzdGVkIGJl
Zm9yZSB1c2luZyBpdC4KPgo+IElub2NoaSBBbWFvdG8gKDQpOgo+ICAgUklTQy1WOiBLVk06IEFk
ZCBTQkkgZXh0ZW5zaW9uIHZhbGlkYXRlIGNhbGxiYWNrCj4gICBSSVNDLVY6IEtWTTogQWRkIFNC
SSBGV0ZUIHZhbGlkYXRpb24gc3VwcG9ydAo+ICAgUklTQy1WOiBLVk06IFJlc2V0IHRoZSBTQkkg
ZXh0ZW5zaW9uIHdoZW4gZGlzYWJsZSBpdAo+ICAgUklTQy1WOiBLVk06IE1hcmsgdGhlIHJlc2V0
IGNhbGxiYWNrIG9mIEZXRlQgZXh0ZW5zaW9uIGFsd2F5cyBkaXJ0aWVzCj4gICAgIENTUgo+Cj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgNCArKysrCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfY29uZmlnLmMgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICAgICAgfCAyNyArKysrKysrKysr
KysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4KPiAt
LQo+IDIuNTUuMAo+CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTcuMwoKVGhhbmtzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
