Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F3C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MebzAJjdVFr/HL7wUboCeLZFvvq7o+JeTNqdeXW4kGY=; b=v/k/lOV+l+EjJQ
	9zYApZXYQyadgcbhG8WZpB/GxmDMx9TXWH3R1g31RxkD3zEc2odYZWuqPJfbL96UnEwIkNU7JFJTs
	gSUMXU7ADIZ++V1MzVowpcRb0u+uyXUA0eTheaWqPlgu9xWEkOpE4ofDw4v3FkZ9VmlJtOPUXqAR4
	5++KKxnrlih3qkS3V8bZXTby9BiKBtyXMC9G/IyZCY2zidKvwKLTiwiFkJY3aqDVCJNUs6Qp7e+g7
	Y2+9CokSUvFyCrUZqWX/eFnb6ZyXJdketM7AdLpnN4mQnStScS+B1DHb+FdhP2teyyVRwkdw7Ktbs
	H+Hr1Zp+Ydk1LYaHtrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvySA-00000006K2W-224Q;
	Mon, 17 Aug 2026 14:36:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyS7-00000006K16-3Hqe
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:36:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so24775965e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 07:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786977398; cv=none;
        d=google.com; s=arc-20260327;
        b=IIBthIOgeeIXsD6Iy/xoDhJyTl1afnbhibmlVs8EuEp9prnAq2aA3OillsexuAcJa1
         NSgh2p8Y5OOewytY0MnzdUUWWe4qupq48VLkfv+k2ZSNTiqJGmBIvdUmSf6SHUgBtez7
         UW189EZz8kz5qUJf2ETvm6kNHt7XW/d5PjutXSTw6SMkBW57t9mE4EdV+2seLQ7G/BpP
         GOryVJ2TjalMLfb/W6Tyb8ud0FJkf/vmN//WQOxDC2NFYcK9i73WuL1xQ4ydPYX9Qws8
         vgVdySriNTl1DHOjtLLChyfj6ix1Cd8gSTuOWxLnv0zMcWpUJEikLGt2n7daBE/IzJxU
         ls6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CIbTmeDi+fJb+TkHf3HPjbmUv8yIae1L/FB6sTNMKMI=;
        fh=brfo6Ysyf96agF5jUnIB1va1uhheD9smAXhC4AjqiMg=;
        b=RNtSDbrGQxJiDnt90oFxP7lmqFlFDQtN8eEwStZccDNMOckzViLtjfocPwtUp8oX1G
         6uk/lQ51mZUPhncG4cOp07vM0BipJbFxqhhdOZtwZl1GF3W91i+2NKXS/8alsRBsRKWE
         7EmY33kevbnyLL8rxw3pxS98YRLPUEW2BNkIDL4w6Ml2tflvHPGtIQg+sglyKUFbHzTq
         B3JlclwqshoLpGfSF4EJNQP5ic5cl4enrBi+nBT8GCm2N0HHmL+RZ3Q5ok0F8/6MuF+G
         w4eNUsIR7PCGnYP+q1ynpwVIUm2q/Pb6RShGlXexoBn0VJmCPuCALi34oDHlCPRSDkZk
         lVkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786977398; x=1787582198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIbTmeDi+fJb+TkHf3HPjbmUv8yIae1L/FB6sTNMKMI=;
        b=hcVCE4l3+U8parf+0X3H/pIxswEScJhrfsdhXZuAIDHeA9E/ey/ZiG/PjRO/YT4dK+
         VVQIgLIZP4XDZPGC+Gs3Xt47EQnu2/KOx58TUyAOHx5AI9tR/G9pEieoqr1E8sk9QVxa
         dfDgDSnQTF6yQlQe/fMumJ1Nursc+/KO5PB+IZ6iqA7jaB+BqpPycSzxQ71NH4C+tqtQ
         jj8hjiQNgV+LFfcjlDYK0br+do+LyXLHsKShPJiTC0WhYijiigwLKM2MohhWA9/C9G2y
         cLNYGvLhoHxf72OaZ/wPIl50UEzryftNlBjB+RDXIN97L4QO94WiQdiMBf4RBm7nBCR9
         JHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977398; x=1787582198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIbTmeDi+fJb+TkHf3HPjbmUv8yIae1L/FB6sTNMKMI=;
        b=IqjExDgXXklcT9vB5GBYe7Ecq9Z8c4J4HEN1gnkbJDfX/hgn+84Zn0PxiTZlx2yWil
         nOBPdabKlVjfiwYNwMGq85bC1ilPHsyrSc5Uw9+X6V53tw/V9p5kdwK4KKNnDG+aYIEb
         gSCSQAjpLzOR94DFsC3HuzMBF2HCE3zQ5a2W9bMg1B/kYVKet0oYNf+gHWtnihFsVEZ6
         7+otfKS56kTCcKWjOfEbX0Y9n12hJ4AbwZcdQUCOIzijhbqQiu3RhCoec/A1/PHROeif
         6UT2hXsl7HekYx+vL0fX2TDvIrNaY6gjtZGxNa6urYxDqUfYJtmwbxtbRr/8P5ONruDp
         LwvQ==
X-Gm-Message-State: AOJu0YxmYlgj6rBmkAxtFwelz2QcUwST2CZrvGHRSlaZDPj/0Q97wjTM
	4hrpzhVDWnuOl5iUA3HDG2pmWVuXRFo0SnMuRqrqTzce2GvB5cEONbstPJJufl6J+KUXPjJiHx0
	V9uZTfs7E1MS528qZAxJzxp0iMZQ+8U1aFeok5ZJOCg==
X-Gm-Gg: AR+sD10hxBFG6wcrT7JaLa17X1zuAW8ZtyOUL4nIaKLbRXNMvfsIAuJI5lXbik4FcDj
	emXK+CWaWgCXCQ8AMAQHXF7ROFJYk/heXyNo3ZMHDlQ2FJJSEbg0gbD/WrsAmiSHZJXfYTN1JKh
	Utxq1DzeyRyzqCkOY2bDQJZws+O0s+RZ64+4T21XiH3mKaxfWgRezQ4tErtwsCkUBiP8NzHjNdH
	+dKCNKnYyPw9N4O9qwWr5RhdPF1Fov79RankdiSeyPRWQU3B/gmgvhi1XJvw6vUIOwoEfGZLy83
	sUnASfDcv3qpMfkaG53uitgp8g73X6ysNgYZqSk5E43a2PjtYXKL0oPEUXtoeV+alrlrpIKnM+9
	1z7CmV6AyozRy/C/QN5kYagPEZa4z1bnXmYV2hz9md+lWVE9nxVSz+wPCElvXFgs=
X-Received: by 2002:a05:600c:3b1f:b0:499:8a3a:fd3a with SMTP id
 5b1f17b1804b1-4999fb1514fmr8194465e9.5.1786977397732; Mon, 17 Aug 2026
 07:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-5-guoren@kernel.org>
In-Reply-To: <20260816070049.2097442-5-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 20:06:22 +0530
X-Gm-Features: AcwNN1WsR7TwQBUawAOEd61qs_8z29NdQyXRkmo_MxZlXHRdYVgl0c9K4Eh2KGA
Message-ID: <CAAhSdy3shr_rc-4=ehdRVHgLeO6QM_7Ubt6pczEtQt=4y9H1Jg@mail.gmail.com>
Subject: Re: [PATCH 4/5] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, hui.wang@canonical.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073640_546062_D17E803D 
X-CRM114-Status: GOOD (  15.12  )
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTI6MzHigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPgo+IFJlcGxhY2UgdGhlIGhhcmQtY29kZWQgQklUU19QRVJfQllURSB3aXRoIElQSV9N
QVggbm93IHRoYXQgdGhlIGNvbnN0YW50Cj4gaXMgZXhwb3J0ZWQgZnJvbSByaXNjdiBhc20vc21w
LmguCj4KPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5v
cmc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1zc3dp
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1zc3dpLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1zc3dpLmMKPiBpbmRleCBjYTA2ZWZkODZmYTEu
LjVlMDEwZmM0MDFmNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1z
c3dpLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWFjbGludC1zc3dpLmMKPiBAQCAtMTM4
LDcgKzEzOCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjbGludF9zc3dpX3Byb2JlKHN0cnVjdCBm
d25vZGVfaGFuZGxlICpmd25vZGUpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFJlZ2lzdGVy
IFNTV0kgaXJxIGFuZCBoYW5kbGVyICovCj4gLSAgICAgICB2aXJxID0gaXBpX211eF9jcmVhdGUo
QklUU19QRVJfQllURSwgYWNsaW50X3Nzd2lfaXBpX3NlbmQpOwo+ICsgICAgICAgdmlycSA9IGlw
aV9tdXhfY3JlYXRlKElQSV9NQVgsIGFjbGludF9zc3dpX2lwaV9zZW5kKTsKPiAgICAgICAgIGlm
ICh2aXJxIDw9IDApIHsKPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJ1bmFibGUgdG8gY3JlYXRl
IG11eGVkIElQSXNcbiIpOwo+ICAgICAgICAgICAgICAgICBpcnFfZGlzcG9zZV9tYXBwaW5nKHNz
d2lfaXBpX3ZpcnEpOwo+IEBAIC0xNTIsNyArMTUyLDcgQEAgc3RhdGljIGludCBfX2luaXQgYWNs
aW50X3Nzd2lfcHJvYmUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGFjbGludF9zc3dpX3N0YXJ0aW5nX2NwdSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFjbGludF9zc3dpX2R5aW5nX2NwdSk7Cj4KPiAtICAgICAgIHJpc2N2X2lw
aV9zZXRfdmlycV9yYW5nZSh2aXJxLCBCSVRTX1BFUl9CWVRFKTsKPiArICAgICAgIHJpc2N2X2lw
aV9zZXRfdmlycV9yYW5nZSh2aXJxLCBJUElfTUFYKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4g
IH0KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
