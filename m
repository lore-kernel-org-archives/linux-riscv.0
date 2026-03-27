Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBA610ED674
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeieczUiXwjtSVE8+tuISJP1rzZmwXVwkJGbTStC5A4=; b=S3TZ6Ljw4k2BAR
	XkFuWSeD8vSBHybWEQS4tOHpKy0NiVlBXP2fexQkeC4xnEJuSjC9KaaUqWstnqfuQg1rgaVzL0yaY
	LPiV7bVyE+vlQcwPlHivrKLLz0HDUrKCF4L9UBVizfWxrV9m+mHjmC0cjpgv6cVnYF0HpUawlA6qU
	IS5v459fnv4j5zwny7v5HKIWaXf9FMWADiZhB0aw3MU4Epkr7aEPY2cXuUniWNdU9romt2ztbNKai
	l8MfvvPkejWlsBp6ZL+DAyOHbY4McQwNhkSSzHzDmKqjStE/sEQwGyD5U+Yu7QgV4vKQiDazdoxYX
	2kULvv+jRhPS4zbiyAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66my-00000007Ngy-0exE;
	Fri, 27 Mar 2026 12:59:48 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66mv-00000007Ng1-1nfT
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 12:59:46 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-67e0d3f288aso972675eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 05:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616384; cv=none;
        d=google.com; s=arc-20240605;
        b=fOGgubc8S9MHEBX/HX7sZWT1cRQqA+dvqKozUGmjwfuKnJhpLVyKpkLRtwe2BCtxg4
         sDqClAoEsiDQaEo7dBbhNeGQtOZctq5vxD2MMoPjN864ujrpEhBvnv1W6t9HDXKUIxZo
         di+ZqplkLdu3Wj5u2rOruxefbhJXp6xrBvsXmvyHGzyNeNEuzbmPNlfc0pYug/mrViZu
         mW+0K+5Xm6DuJIwul13WotGIaRBAUyZNvrVX2B9TVVBhQow+ddOKac7aIBiyNE6hDeNg
         w4SCImTg4i8jqjpFTsIKS0BAAMq+bu9kHqCh1tCgyqu8APrMUfaj8XIZxEDtR/0wx9G1
         e9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        fh=qsmBnD8x4n94yKcVJmckzqE+NwVlOFevhJwsg40HD9g=;
        b=YTT29TTCaQDWsvjR4cVGb0g7yZIegfZiRz1cyXFmu3BnkLQBZUneN6uhwwoVFs+2o6
         b/AG12HtVJ/Hf/McApA1W6Cw6WXyYH8Lw295T7wflVeoNcpxzfoIxBov6wGcPezoNHmg
         PVf1Luh20HuVMOslXxIMYEUOef02j5WbUEDTObju3lOosnUNlanN7bAkkQuWsTNOzO2t
         LSOjmOUkUcJraO8hDDyOl8cbwU+XS9z2fJ3YwdDPh8CK4AxggHOUl7xARarFZEOs+cJx
         J9WZoa+Jyiv7ThlzRnEUM1TVzAXslGxWpIjDjhBWNWigSFcrH9ph5kfEiFEJXPKrCB6m
         hNcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774616384; x=1775221184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=eNzFZMyRokgODSud22G21txF+ZgQ4QZbfjnAPUlqEu7eyxxpj824eNsY0I71YvLrg3
         Tl8gy96QwrOCKdSSjARR7uILYKudDUxQG2CSKzoRHfHg0xtnDVikn6Q45KGP3EnN4uUG
         t5XgfFwH5f04gYhOlv7+IMO27uRZM+3NE0Ha1sBt+B+ZI9zG4jTpWha2Gr4OU/mQBJg8
         otFx1pG68vHi+m6r/Yp7wK9IiBx8EHpitG9LWDRny28bFH7q+czPaLp7sjG9U8/+v18B
         da/KjJ3nvKhVIWQmTinbkbI0fTEnR/Ez9gjamM2E0UqjzeLdkA15dl7DxGw6SXCjsUdK
         P2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616384; x=1775221184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=TvI5FniYm+nqgNcQUAowjTInuJ0mndBMmGCX8DdnZsvj8S+O2M2yKaBTn2S5XaYbq5
         5ASaqrzMGCbhW13lVtTAjjfMsEm3GLSvNqTqmdykmKjkiHWUowlwtQiIMvvTCVaS2QU4
         aur+vz7J1lpNXzH6Ofec0Dq6SV+X+rf1DPWl6LKRtyojCio+mK96cZXW45bpuFWlJk2s
         SFLCcvCO2sTayZ0lxR24RUCg71rVsn/Ue97GB62nNc2O45VldjWP/TYBQPW1cRMlydud
         JmFcL3oG2Wy2cZGJmQykaGBKRbDO8V9Oz/pAJtkkw+qAzd0DbcFHUsitDDx9yoc/kDuz
         arTg==
X-Gm-Message-State: AOJu0Yx3v56RH/44HReG7Pv5ZoqevqRjHU1lUqvMXhfVMnWp+K96H0Vn
	hYVq354kKIsRmma8B2frWVmkFjDDvRmV/E4spOj0TNhgs7mBK+exCCgb0lcDtlsNqIApPI60VZ5
	ONvyc/pGRNHhVfMWeU3zQtE8qGv0KuST3lUVaY53VRg==
X-Gm-Gg: ATEYQzza/vjaJYjLqnH+OG1Bs1IStWxE/FIg2I6LX3dMGIOY8bXr8E9jTWVgh0iBp9u
	sYsw0Wi1OpSOhDJlJdmr70oW0mAMSlXD2Yw04w/QTitIGjNNQHLiqB3JKqNh58eE0oMXM7eqoTU
	z4Y5CxsxMnAejp2U70jZdNf/Bfw7OFOP0lb8E6Y+xxNZLkcOa219X8O5FFPpoSfKvdmhJMfgch0
	R70XOggkF8qE6s8CIcELBC1UQDk/vTFq/aWVEshnsCRaDCSfIT5hIGzysB0HIHJc4XH9ZjggvBB
	78/PG4GalQC4RCNUzbY33z3A2cr9oHDt3Lt0btqg6HTOHXggKYwHxvVDFzAuNRMzhp7YGxglKDr
	Wlhlqs87OeNzKWJnzdB1oCC1oJA==
X-Received: by 2002:a05:6820:221a:b0:67c:2b6b:520c with SMTP id
 006d021491bc7-67e1875a871mr1122414eaf.62.1774616383734; Fri, 27 Mar 2026
 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:29:31 +0530
X-Gm-Features: AQROBzCGKH8Yynm5vTwqjoLikHfT_rvE6B5eaTVPa88iE5QN8BHshTiNb-us74k
Message-ID: <CAAhSdy0Jw_XvVK5brSRN3QGvnYHNEJc=tL65z+iUnSSjFObuPA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] RISC-V: KVM: Validate SBI STA shmem alignment
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_055945_621533_C7830127 
X-CRM114-Status: GOOD (  11.58  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA2OjM54oCvQU0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgYSBtaXNzaW5nIHZhbGlk
YXRpb24gaW4gdGhlIFJJU0MtViBLVk0gU0JJCj4gc3RlYWwtdGltZSBhY2NvdW50aW5nIChTVEEp
IHJlZ2lzdGVyIGhhbmRsaW5nLgo+Cj4gUGF0Y2ggMSB2YWxpZGF0ZXMgdGhlIGNvbmZpZ3VyZWQg
U0JJIFNUQSBzaGFyZWQgbWVtb3J5IEdQQSBhdAo+IEtWTV9TRVRfT05FX1JFRywgZW5mb3JjaW5n
IHRoZSA2NC1ieXRlIGFsaWdubWVudCByZXF1aXJlbWVudAo+IGRlZmluZWQgYnkgdGhlIFNCSSBz
cGVjaWZpY2F0aW9uIG9yIGFsbG93aW5nIElOVkFMSURfR1BBIHRvIGV4cGxpY2l0bHkKPiBkaXNh
YmxlIHN0ZWFsLXRpbWUgYWNjb3VudGluZy4gVGhpcyBwcmV2ZW50cyBpbnZhbGlkIHVzZXJzcGFj
ZSBzdGF0ZQo+IGZyb20gcmVhY2hpbmcgcnVudGltZSBjb2RlIHBhdGhzIGFuZCBhdm9pZHMgV0FS
Tl9PTigpIHRyaWdnZXJzIGR1cmluZwo+IEtWTV9SVU4uCj4KPiBQYXRjaCAyIHJlZmFjdG9ycyBl
eGlzdGluZyBVQVBJIHRlc3RzIGZyb20gc3RlYWxfdGltZV9pbml0KCkgaW50bwo+IGEgZGVkaWNh
dGVkIGNoZWNrX3N0ZWFsX3RpbWVfdWFwaSgpIGZ1bmN0aW9uIGZvciBiZXR0ZXIgY29kZSBvcmdh
bml6YXRpb24sCj4gYW5kIGFkZHMgYW4gZW1wdHkgc3R1YiBmb3IgUklTQy1WLgo+Cj4gUGF0Y2gg
MyBmaWxscyBpbiB0aGUgUklTQy1WIHN0dWIgd2l0aCB0ZXN0cyB0aGF0IHZlcmlmeSBLVk0gY29y
cmVjdGx5Cj4gZW5mb3JjZXMgdGhlIFNUQSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLgo+Cj4gSmlh
a2FpIFh1ICgzKToKPiAgIFJJU0MtVjogS1ZNOiBWYWxpZGF0ZSBTQkkgU1RBIHNobWVtIGFsaWdu
bWVudCBpbgo+ICAgICBrdm1fc2JpX2V4dF9zdGFfc2V0X3JlZygpCj4gICBLVk06IHNlbGZ0ZXN0
czogUmVmYWN0b3IgVUFQSSB0ZXN0cyBpbnRvIGRlZGljYXRlZCBmdW5jdGlvbgo+ICAgUklTQy1W
OiBLVk06IHNlbGZ0ZXN0czogQWRkIFJJU0MtViBTQkkgU1RBIHNobWVtIGFsaWdubWVudCB0ZXN0
cwo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jICAgICAgICAgICAgICAgICB8IDE2
ICsrLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX3R5cGVzLmggICAgfCAg
MiArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9zdGVhbF90aW1lLmMgICAgICB8IDk4
ICsrKysrKysrKysrKysrKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4zNC4xCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBm
b3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
