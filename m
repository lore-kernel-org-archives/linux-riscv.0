Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FAC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1qIC0Lc93UexbfzfH4YhVN8/0R1v257IzMCjga99ZE=; b=v42dE8anB72fxq
	E2xTjvMfcvw4x0N3aygSUOn7xAyO0Au7pK96+NTAEuTdKymATqZ7B2TW57PirIaZPxKdBXH6M95hm
	av/W/LlRulZDDqsmUH5hmWt3tWK5HoqMUN5438pSly7B9BlCgqY8IomktSwr7UuCNKvhFw9jKmKvZ
	VT/Dy/SrM0oYEiwYPNWbx9Vim6mVV3Dftqu+prBMV10JhHQZw7J224Q2myS4cwllHHexDtzlgzATJ
	24kZgX32WKe6V8JrqNZ51Vd1e5a5Fom262ERWT67l2aFMblzyZmTf5HXCZjNS/5kHhgsUZzlAZGRQ
	QhITLEiCmGk3AYmwBNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ash-0000000Dq3L-3drI;
	Thu, 10 Sep 2026 09:15:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4asf-0000000Dq1s-1jVs
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:15:43 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so1242666f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789031739; cv=none;
        d=google.com; s=arc-20260327;
        b=JYCare/mQ3khaCwCjrq9rV2QhwboWt8seYema7wORB9Tk4xGcwQuYYMPn7+tf/SBwz
         B0fkXt0Gm1CzMmgEki0l5mhDdb1vZClxSsWvOU0zW5+4X2q6YSqF4+RNSzdGsmmzIryN
         FzHV/b4AaWtoHTvGmFmOe+gI/VmKUmX3LB9fSI9cvkJI9g97T+aTEJ8iM/aWjrBG9xn/
         xtVuuwum9mYdTN7JXyHLbDOeIFNALyXhc1Tn/+VwSUpav4Z+zmCN+ysnNw5x1HjxHGse
         omhfzr3QbWLT56NzM+etc5ZLhN1kU5E2W9p7oDGH4M0TYpOtyjkeUp2wWBsAHU68dJao
         yElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        fh=g3XPhziDwb+86qtOo2BmqSRASl8s2PbpyAeHgFOgn9A=;
        b=kaWRmf3meEtiS61bwGa2O7qnIv3sbsr+6xUT4s4v+jPKG/zw98L4lTjO+EkYPcFGVX
         rMzFgmrdYJOIn+MBAGN1cCTmH0RQu9CsfsW23pJmhHL+FMp1YMjNkpTy1JJR3xC59a2+
         gRdNjWvHCEAfh2C+i+TuXmrK35ShzOsUVLS8zrhS3KKiuL/COPckoOUB7pd5hnQO9GXI
         QJO0sDg5tcqTMF9hdesRPqxoR7f0DsOi+Bhdo1Jvg1i/IGR85vLiuwcqTvznJTLfatg+
         li9+lUFvKvETC/NgDsmLCxhgL4TaaIGR4oXX6nbZLNnYi0D+OEF14V0+Oj4EU4+R01VY
         fQQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789031739; x=1789636539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        b=lrvWwX5lhBoF2WZNv01Dzzf2ENvdSlRdYhe+QBelf11tr5SszD4yFREFCbkQnEmMG2
         zcQQY0vBwaxqS0v+Od9L9zphVzJg26XGAZdsIwGfpmjyjGtqcl2S0ja8lgY3awy3l5Fy
         6qOOxZ9LxMwC77SRe+GIQWjVg7AvlTTw73cbx9ndWDmPoJmRtJyov+Rf6Nia38pb+pdv
         UQ0tnHlKqRF5egQi9bLl0wzMKE30m99xwbfKUQMQsavrrkX0Ms+INdn2gxaLM/xi73Dv
         R7p07HCUv/O9YaEDknz81XoaSosklMofpE3qtCIr9/+O6v0H59Ucxi90hLFejD7d2s1X
         Z4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031739; x=1789636539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        b=jCAPuB3jR7xN2UE4EEQ1oYZZR7BLAhDfmMisGKlfEOkkOaBCGootyoik0RZ29AOtM8
         +gmh1lAMcZveb+LV3B37+wy6It81IuyXNk+FrR2GO5c8kOhiI2evoZ/vw9luopMMJVC4
         qWjza8tQuekAF+WmNOxzsyv19cLdemnpYiBiPUKHD7jjv0BrAbidJL9FGy4JcyZPZm8N
         6O82qrFtQW693E283nGHhsTnRPiJXXh5Tef12ydI6LZJIqpE3QIdeqqEaLjk+qp6m6M9
         7qph+G5qPakpoCNqd8J1/3OHKD0RVSXyYAf1pd9XMnEiP3IQV/apf4dbyZl2I/Hi325K
         w2iA==
X-Forwarded-Encrypted: i=1; AKwUvBxoSXdWXkQsxgBY26Mq8amTdEbrlpVun4vJnnQI+grAnlfHlgAzOuNac+XCNGUk7usZ037LpFngedZp3Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mVfn/Jfkvj1Dcg/ocfeSCzTee79QyafKPUa/mK8oAMslCWk/fF
	uvmB1y3dorUdPQ7xk+SXtruZUHW7gmEkNbxU7BO819uHj0nf4DJx95BOdk3eJhu5f4vaTvixWME
	jWYk9yQYzZala+BpN1BUtEWjuXt7hgUHi1/xN3v3/lw==
X-Gm-Gg: AYBFou2OCuYFjqRXR5HsjRpd9K9AUGe2jTyRo9UmJP/7XLomKrBa1EGIQEzJy1ytW3T
	4k7EWXJFMOu9f5C8Ez0/HyLuJGmGQO9E5m5IVlunwbJ+GVjw6Ix2Qu/W4v5MxV40TuRsJBv+bRa
	58EqbDxWa2nmL67yXVoyemoI8SLoxVlw3J0Lx4EmCN+WElPw1eXTFWPg72w4bRbPxtPw2cJI03O
	DQGMBSTPKoqN9ShiUOvACRZsWdqAk4Q27OvDvSHtsEelSnel8VOId+U1cRf+Cu4VKOy3ruvTJLC
	8gfIqAl+EynghT+00hq6rpG+4KUGhUFQF4OLzfQFAxrpKy9kR3sQciqqG3fkG5dCG7TsJZ5NuPy
	zVbg6rPBxR4q2TCz9hHX3dvKahetxyuL0B1R7wF0GKja7TC9MSpVdg+JkoN1xRMnzImjdxXXPnZ
	uW6q9odJFh
X-Received: by 2002:a05:6000:250c:b0:482:eab2:a752 with SMTP id
 ffacd0b85a97d-485aad9459amr22090129f8f.1.1789031739142; Thu, 10 Sep 2026
 02:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260804134018.85497-1-yang.yicong@picoheart.com>
In-Reply-To: <20260804134018.85497-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 14:45:27 +0530
X-Gm-Features: AcwNN1UbvRR0hvvJQjZ5KxB16Wyg_CeKMamsyoQwMo1Bex_c9WM7c-jHwFAHtWM
Message-ID: <CAAhSdy0WBev1BAEooOHoso_aRJaBcumZpOZXahbgKbk9uJZZBQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix the conversion between vsip and hvip
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, alex@ghiti.fr, 
	atish.patra@linux.dev, geshijian@picoheart.com, shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021541_489308_E87AEE8F 
X-CRM114-Status: GOOD (  20.77  )
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

T24gVHVlLCBBdWcgNCwgMjAyNiBhdCA3OjEw4oCvUE0gWWljb25nIFlhbmcgPHlhbmcueWljb25n
QHBpY29oZWFydC5jb20+IHdyb3RlOgo+Cj4gUGVyIEFJQSBzcGVjIDEuMCBTZWN0aW9uIDYuMy4y
LCB0aGUgaW50ZXJydXB0IG51bWJlcnMgMTMtNjMKPiBzaGFyZXMgc2FtZSBiaXQgcG9zaXRpb24g
YmV0d2VlbiByZWxhdGVkIFZTIHNoYWRvdyBDU1JzIGFuZAo+IGh5cGVydmlzb3IgQ1NScy4gU28g
dGhlcmUncyBhIHNoaWZ0IG9ubHkgZm9yIFNTSSwgU1RJIGFuZAo+IFNFSSBpbnRlcnJ1cHQuCj4K
PiBDdXJyZW50bHkgdGhlIEtWTSBhbHdheXMgZG9lcyBhIHNoaWZ0IGZvciBhbGwgdGhlIGludGVy
cnVwdHMKPiAoaW5jbHVkZSBMQ09GSSB3aXRoIG51bWJlciAxMykgd2hlbiBkb2luZyB0aGUgY29u
dmVyc2lvbgo+IGJldHdlZW4gdnNpcCBhbmQgaHZpcC4gRml4IHRoaXMgYnkgb25seSBkb2luZyBz
aGlmdCB0aGUgU1NJLAo+IFNUSSBhbmQgU0VJLiBBZGQgd3JhcHBlcnMgZm9yIGRvaW5nIHRoZSBj
b252ZXJzaW9uIGJldHdlZW4KPiB2c2lwIGFuZCBodmlwLgo+Cj4gRml4ZXM6IDE2YjBiZGU5YTM3
YyAoIlJJU0MtVjogS1ZNOiBBZGQgcGVyZiBzYW1wbGluZyBzdXBwb3J0IGZvciBndWVzdHMiKQo+
IFNpZ25lZC1vZmYtYnk6IFlpY29uZyBZYW5nIDx5YW5nLnlpY29uZ0BwaWNvaGVhcnQuY29tPgoK
TEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVl
dWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjMtcmNYCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
Q2hhbmdlIHNpbmNlIHYxOgo+IC0gcmViYXNlIG9uIC1yYzYgYW5kIGZpeGVkIHRoZSBjb25mbGlj
dAo+IC0gYWRkIGZpeCB0YWcgc2luY2UgaXQgZml4ZXMgdGhlIExDT0ZJIGluamVjdGlvbgo+IExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwNzIxMTQxODE1Ljgw
Njc3LTEteWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbS8KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdS5jICAgICAgICAgICAgICB8ICAzICstLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jICAgICAgIHwgIDggKysrLS0tLS0KPiAgdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaCB8IDIwICsrKysrKysrKysrKysrKystLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRl
eCBkODA2YTk3OWY1OTUuLjdiZmJkYTk1OGYwZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBA
IC0xODQsMTIgKzE4NCwyNCBAQAo+ICAjZGVmaW5lIEhHQVRQX01PREVfU0hJRlQgICAgICAgSEdB
VFAzMl9NT0RFX1NISUZUCj4gICNlbmRpZgo+Cj4gLS8qIFZTSVAgJiBIVklQIHJlbGF0aW9uICov
Cj4gKy8qCj4gKyAqIFZTSVAgJiBIVklQIHJlbGF0aW9uCj4gKyAqCj4gKyAqIFRoZSBiaXQgcG9z
aXRpb25zIGFyZSBzYW1lIGJldHdlZW4gVlNJUCBhbmQgSFZJUCBmb3IgaW50ZXJydXB0Cj4gKyAq
IG51bWJlcnMgMTMtNjMsIHdoZXJlIHRoZXJlJ3MgYSBzaGlmdCBmb3IgdGhlIFNTSSwgU1RJIGFu
ZCBTRUkuCj4gKyAqLwo+ICAjZGVmaW5lIFZTSVBfVE9fSFZJUF9TSElGVCAgICAgKElSUV9WU19T
T0ZUIC0gSVJRX1NfU09GVCkKPiAtI2RlZmluZSBWU0lQX1ZBTElEX01BU0sgICAgICAgICAgICAg
ICAgKChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICsjZGVmaW5lIFZTSVBfQklBU19N
QVNLICAgICAgICAgKChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9TX1RJTUVSKSB8IFwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19FWFQp
IHwgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElS
UV9QTVVfT1ZGKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVM
KSA8PCBJUlFfU19FWFQpKQo+ICsjZGVmaW5lIFZTSVBfTk9fQklBU19NQVNLICAgICAgKF9BQygx
LCBVTCkgPDwgSVJRX1BNVV9PVkYpCj4gKyNkZWZpbmUgVlNJUF9WQUxJRF9NQVNLICAgICAgICAg
ICAgICAgIChWU0lQX0JJQVNfTUFTSyB8IFZTSVBfTk9fQklBU19NQVNLKQo+ICsjZGVmaW5lIHZz
aXBfdG9faHZpcChfdnNpcCkgICAgKCgoKF92c2lwKSAmIFZTSVBfQklBU19NQVNLKSA8PCBcCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZTSVBfVE9fSFZJUF9TSElGVCkgfCBc
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKChfdnNpcCkgJiBWU0lQX05PX0JJ
QVNfTUFTSykpCj4gKyNkZWZpbmUgaHZpcF90b192c2lwKF9odmlwKSAgICAoKCgoX2h2aXApID4+
IFZTSVBfVE9fSFZJUF9TSElGVCkgJiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFZTSVBfQklBU19NQVNLKSB8IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoKF9odmlwKSAmIFZTSVBfTk9fQklBU19NQVNLKSkKPgo+ICAvKiBBSUEgQ1NSIGJpdHMgKi8K
PiAgI2RlZmluZSBUT1BJX0lJRF9TSElGVCAgICAgICAgIDE2Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDk3N2UzNmFi
ODNkMy4uNDY4OTE4MzA5ZGZmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC00NzUsOCArNDc1LDcgQEAgYm9vbCBr
dm1fcmlzY3ZfdmNwdV9oYXNfaW50ZXJydXB0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBt
YXNrKQo+ICAgICAgICAgYm9vbCByZXQ7Cj4KPiAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2
ZSgmdmNwdS0+YXJjaC5pcnFzX3BlbmRpbmdfbG9jaywgZmxhZ3MpOwo+IC0gICAgICAgaWUgPSAo
KHZjcHUtPmFyY2guZ3Vlc3RfY3NyLnZzaWUgJiBWU0lQX1ZBTElEX01BU0spCj4gLSAgICAgICAg
ICAgICAgIDw8IFZTSVBfVE9fSFZJUF9TSElGVCkgJiAodW5zaWduZWQgbG9uZyltYXNrOwo+ICsg
ICAgICAgaWUgPSB2c2lwX3RvX2h2aXAodmNwdS0+YXJjaC5ndWVzdF9jc3IudnNpZSkgJiAodW5z
aWduZWQgbG9uZyltYXNrOwo+ICAgICAgICAgaWUgfD0gdmNwdS0+YXJjaC5ndWVzdF9jc3IudnNp
ZSAmIH5JUlFfTE9DQUxfTUFTSyAmCj4gICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKW1h
c2s7Cj4gICAgICAgICByZXQgPSB2Y3B1LT5hcmNoLmlycXNfcGVuZGluZ1swXSAmIGllOwo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwo+IGluZGV4IDk5YjkxMDdiMWFjMS4uOWZlODI5ZWVkMTc4IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jCj4gQEAgLTI3Miw3ICsyNzIsNyBAQCBzdGF0aWMgaW50IGt2bV9yaXNj
dl92Y3B1X2dlbmVyYWxfZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4KPiAgICAgICAg
IGlmIChyZWdfbnVtID09IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzaXApKSB7Cj4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl92Y3B1X2ZsdXNoX2ludGVycnVwdHModmNwdSk7Cj4gLSAgICAgICAg
ICAgICAgICpvdXRfdmFsID0gKGNzci0+aHZpcCA+PiBWU0lQX1RPX0hWSVBfU0hJRlQpICYgVlNJ
UF9WQUxJRF9NQVNLOwo+ICsgICAgICAgICAgICAgICAqb3V0X3ZhbCA9IGh2aXBfdG9fdnNpcChj
c3ItPmh2aXApOwo+ICAgICAgICAgICAgICAgICAqb3V0X3ZhbCB8PSBjc3ItPmh2aXAgJiB+SVJR
X0xPQ0FMX01BU0s7Cj4gICAgICAgICB9IGVsc2UKPiAgICAgICAgICAgICAgICAgKm91dF92YWwg
PSAoKHVuc2lnbmVkIGxvbmcgKiljc3IpW3JlZ19udW1dOwo+IEBAIC0yOTMsMTAgKzI5Myw4IEBA
IHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2VuZXJhbF9zZXRfY3NyKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKPgo+ICAgICAgICAgcmVnX251bSA9IGFycmF5X2luZGV4X25vc3BlYyhyZWdfbnVt
LCByZWdzX21heCk7Cj4KPiAtICAgICAgIGlmIChyZWdfbnVtID09IEtWTV9SRUdfUklTQ1ZfQ1NS
X1JFRyhzaXApKSB7Cj4gLSAgICAgICAgICAgICAgIHJlZ192YWwgJj0gVlNJUF9WQUxJRF9NQVNL
Owo+IC0gICAgICAgICAgICAgICByZWdfdmFsIDw8PSBWU0lQX1RPX0hWSVBfU0hJRlQ7Cj4gLSAg
ICAgICB9Cj4gKyAgICAgICBpZiAocmVnX251bSA9PSBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc2lw
KSkKPiArICAgICAgICAgICAgICAgcmVnX3ZhbCA9IHZzaXBfdG9faHZpcChyZWdfdmFsKTsKPgo+
ICAgICAgICAgKCh1bnNpZ25lZCBsb25nICopY3NyKVtyZWdfbnVtXSA9IHJlZ192YWw7Cj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL3Rvb2xzL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAyMWQ4Y2VlMDQ2MzguLjhkZjY0MzE0
ZDYxMyAxMDA2NDQKPiAtLS0gYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4g
KysrIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0xNjMsMTIgKzE2
MywyNCBAQAo+ICAjZGVmaW5lIEhHQVRQX01PREVfU0hJRlQgICAgICAgSEdBVFAzMl9NT0RFX1NI
SUZUCj4gICNlbmRpZgo+Cj4gLS8qIFZTSVAgJiBIVklQIHJlbGF0aW9uICovCj4gKy8qCj4gKyAq
IFZTSVAgJiBIVklQIHJlbGF0aW9uCj4gKyAqCj4gKyAqIFRoZSBiaXQgcG9zaXRpb25zIGFyZSBz
YW1lIGJldHdlZW4gVlNJUCBhbmQgSFZJUCBmb3IgaW50ZXJydXB0Cj4gKyAqIG51bWJlcnMgMTMt
NjMsIHdoZXJlIHRoZXJlJ3MgYSBzaGlmdCBmb3IgdGhlIFNTSSwgU1RJIGFuZCBTRUkuCj4gKyAq
Lwo+ICAjZGVmaW5lIFZTSVBfVE9fSFZJUF9TSElGVCAgICAgKElSUV9WU19TT0ZUIC0gSVJRX1Nf
U09GVCkKPiAtI2RlZmluZSBWU0lQX1ZBTElEX01BU0sgICAgICAgICAgICAgICAgKChfQUMoMSwg
VUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICsjZGVmaW5lIFZTSVBfQklBU19NQVNLICAgICAgICAg
KChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9TX1RJTUVSKSB8IFwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19FWFQpIHwgXAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9QTVVfT1ZGKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19F
WFQpKQo+ICsjZGVmaW5lIFZTSVBfTk9fQklBU19NQVNLICAgICAgKF9BQygxLCBVTCkgPDwgSVJR
X1BNVV9PVkYpCj4gKyNkZWZpbmUgVlNJUF9WQUxJRF9NQVNLICAgICAgICAgICAgICAgIChWU0lQ
X0JJQVNfTUFTSyB8IFZTSVBfTk9fQklBU19NQVNLKQo+ICsjZGVmaW5lIHZzaXBfdG9faHZpcChf
dnNpcCkgICAgKCgoKF92c2lwKSAmIFZTSVBfQklBU19NQVNLKSA8PCBcCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFZTSVBfVE9fSFZJUF9TSElGVCkgfCBcCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKChfdnNpcCkgJiBWU0lQX05PX0JJQVNfTUFTSykpCj4g
KyNkZWZpbmUgaHZpcF90b192c2lwKF9odmlwKSAgICAoKCgoX2h2aXApID4+IFZTSVBfVE9fSFZJ
UF9TSElGVCkgJiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZTSVBfQklB
U19NQVNLKSB8IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKF9odmlwKSAm
IFZTSVBfTk9fQklBU19NQVNLKSkKPgo+ICAvKiBBSUEgQ1NSIGJpdHMgKi8KPiAgI2RlZmluZSBU
T1BJX0lJRF9TSElGVCAgICAgICAgIDE2Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
