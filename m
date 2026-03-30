Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB4BF3D60F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrI2Oh9VrunoMd0bL+goqppIFLmhgMbt9W/YwpC77no=; b=dZfN611uGl1A2g
	oMzqx38zOwyMpOxDnbksSOsLuU/YhX5bV+z+A5awFC2y6vim32NhP3cqSp/6Ba2oT6XGCJAoHToxz
	MF2dZW7CsyTpcMHX5+9oYYXA+skJ0CSxVgbW/71Qi4OydgTPbSwYeI54LclG+dBXrJxQe21n9hNWD
	n+ujL4G1bKZAJjVW22uee7/Ilr/81pCBwIrQ0c2ium+NsEDGYgItILIhjY9DARALYbKI8DimHs05V
	hmsHG2rQ+JIx/Q8hdEMdyk97c7ZeR8Xpc9haKTk3c5F7H7D/OcDzkUdLpih5OuzwoBAvAxbKr/Ep2
	lEo7tD4kYi0Sz5npahiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xW-0000000Aqv1-1xCw;
	Mon, 30 Mar 2026 08:26:54 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xT-0000000AqsY-0EAd
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:52 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d9bba96f7dso2206422a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859210; cv=none;
        d=google.com; s=arc-20240605;
        b=DwIA0fMi621ObZVd8HdHXPJZ2UxlrP4aAm1mgYMiK4RN6r4F8Ta3GZ1457fWbYUvxw
         fi3tMFtz3y2n/bAZm9fCOkYiFW+Y7nc9y3R9BNfdRvbjAdpRWFtuUNmopbtgsXVrFhzJ
         o7Ikno4XTCp5jhKKHqQPQy5yZ3ROy/s7u89CabTlmQ8J5FJb2RGgmnORLxkA0wJ2aE/z
         RNMXwasfcCtRjAmjQFUpV3kzt/VCp5JQl4TrjV0WwoJ9mtgEbCbRukHTof/66zyRZ4qb
         R6jkp7C1qFsAzi1+JVq5kRS+cPEoh242VwedRUVhJPZRJ38KH9sR4OcjRnZSzhXeIom4
         hR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        fh=4uOiOLLZshDUlScusYsyEeS58ecuv5XL7hYSWf9yFs0=;
        b=dTi3cX5dsS0T3NJcobnkeFlCyC05ZCQhYG2IU/BrWDNu2Wp1kryAVklMo3WvVAsG1p
         JRjaN/eNtY1/MkwJIJReK4+lBI/3fK5TvjUNWhSfS8OySvgDMOlfaXnY7l8WmtumS2Fe
         yDLNjOQ1a4NrMqnDYQY5Gj3D4kSlRkgafIPoEeeMParslfmUG1CHqlSYDtd50ocMPVvl
         TNlLmAnigSPzBco1UHMhgSdegES1mkqdpZMNS4aDkJMvuF3mxHKpXWjj7LRu1QSNE3Lz
         nyGjr4ye2YQN2l+bZCtf/j1eE+DcJkqNrOa0NDMGELxRwp9c6W06NvUUXV+BE4b7JTUm
         hxkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859210; x=1775464010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        b=sjd68iKeCEIG2RwRMHtYv5fa0a0/Jy/PUhnDauiirURDm9ubrYqrWON7rAjA/G4Egb
         N4LRnBLq8gRkpYt1TN+9oJn1thUg75sLNwp9bsd7spbgprUTjj1M1QaXFeM/shMWzISZ
         n/DByDLwXL6S7PnMI3CCjBXB8BNSunixpfevCjNOxTz9OWpMUjhDO+htlKTsk2Xlzb0+
         CzcB6mVtfQkREsJ4ztN6z+IvAnkKLp5oIFyC9PdeVpt2KY3SnYppHK6UK0LaEags5vCm
         B5Lu94O9uelSVCtScuOlUBo87V/a8osZPSjJJ17gj+M1sc/MuFOFxAQKOdMKctDJ+Wj4
         AL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859210; x=1775464010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        b=clqhzJt/rAEdn7cDDPFnzkp0VfHwgRPkQt9HHb/8aCP3AfbIO+GxpFegamL0mn1AFf
         XQQuhPBmjVp70dlfVraQ2DmKhk09lHz+JV87+B5tTXfqXi+LN5Fuv75WEhuhEAnrb+lc
         EZSj45233n1Qc3d/wfIs3uHrifvybnDnU86ki15cmi1wIslkr1eWm2ox4I+YNJvUs6C7
         4sR1LvhbRxYw553Z8ScAh95oD3rEDYD4xa0AQ7/WEFySvJdDmzBbk6wetiarP3inAeXA
         QziZum6gh8S8yOK9sNtcie+VIeOO4q1NoC7K/zHskg07xAMw+klvugDMxvF9uKiX2T5d
         ZVgg==
X-Forwarded-Encrypted: i=1; AJvYcCWSPXmEYjZHcoDCv9UhFjzdrdA8Yq3h7BUYp5B6gStRzD1yFJFCfDUUy9tME0ZIp//pERf2vM6AkqP9cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUc+ALlDHisaYwgmOTydPtxLknsizPJK1gaZL4qzqvZ34vKvbb
	scYv/NEyRC/cV5XLQV0gpJdr5NA9f4/sK61t1Hp4W35yqbvOe+jlOVp4IrCe9yM7oN1kIAo0BtQ
	S8QFPZjlPAbPL/zj+Fmf0JcMjV7qOlrYKyXTw2CykgQ==
X-Gm-Gg: ATEYQzy2gJ8/zwvAbSXgNbwoKh+ef3UQsWVGX5m8kQLOs9ey4DXeliWRHg6eyoeTY4p
	nc3tBhRa9JGa5oRRdwMl01Ujr3xOtyejSs6znc5YlwxCsJThAa9gIgMJd37vu7ejGzHie8sJnal
	lf7r0h+19HjhVeBPH09UJtA1HIi8fCViCKcgI8TrsUrKM3BZNC/9swobvbFYorNXetYDvBk6MMV
	Rob/h2etPmo2Oz05JqESfdZcB9h720fbTcXof+JYUbIfrAlaWyJJKnOsVMHwcBKUpHfI+dNvkwW
	4tvGfhWWNyFVQrcbara/5eSbBFM1ZFbMVHGrQJFsZyJ3Kmhv2Y2x6LxLEECifaz89EZTjHtmYtl
	I1P8fZISo3wQSZI7ax8AUYaIFLg==
X-Received: by 2002:a05:6820:81c1:b0:67e:294b:726b with SMTP id
 006d021491bc7-67e294b7605mr3423411eaf.40.1774859210004; Mon, 30 Mar 2026
 01:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:38 +0530
X-Gm-Features: AQROBzAttgYdkDk6vZa7Y9rWU3gasICclOjTZXUHJQOVCZXeCVLUqT-WwqE4H2U
Message-ID: <CAAhSdy01NHCwXRXMkpCrYSLpdApB5EC4kU9qig3q2KD1K34Atg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012651_105362_242D0FC3 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMzowMOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEluIGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9z
ZXRfc2htZW0oKSwgd2hlbiBrdm1fdmNwdV93cml0ZV9ndWVzdCgpCj4gZmFpbHMsIGt2cG11LT5z
ZGF0YSBpcyBmcmVlZCBidXQgbm90IHNldCB0byBOVUxMLiBUaGlzIGxlYXZlcyBhIGRhbmdsaW5n
Cj4gcG9pbnRlciB0aGF0IHdpbGwgYmUgZnJlZWQgYWdhaW4gd2hlbiBrdm1fcG11X2NsZWFyX3Nu
YXBzaG90X2FyZWEoKSBpcwo+IGNhbGxlZCBkdXJpbmcgdmNwdSB0ZWFyZG93biwgdHJpZ2dlcmlu
ZyBhIEtBU0FOIGRvdWJsZS1mcmVlIHJlcG9ydC4KPgo+IEZpcnN0IGZyZWUgb2NjdXJzIGluIGt2
bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oKToKPiAga3ZtX3Jpc2N2X3ZjcHVf
cG11X3NuYXBzaG90X3NldF9zaG1lbSBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jOjQ0Mwo+ICBr
dm1fc2JpX2V4dF9wbXVfaGFuZGxlciBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYzo3NAo+
ICBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYzo2MDgK
PiAga3ZtX3Jpc2N2X3ZjcHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyNDAKPiAg
a3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4gYXJjaC9yaXNjdi9rdm0vdmNwdS5jOjEwMDgKPiAga3Zt
X3ZjcHVfaW9jdGwgdmlydC9rdm0va3ZtX21haW4uYzo0NDc2Cj4KPiBTZWNvbmQgZnJlZSAoZG91
YmxlLWZyZWUpIG9jY3VycyBpbiBrdm1fcG11X2NsZWFyX3NuYXBzaG90X2FyZWEoKToKPiAga3Zt
X3BtdV9jbGVhcl9zbmFwc2hvdF9hcmVhIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmM6NDAzIFtp
bmxpbmVdCj4gIGt2bV9yaXNjdl92Y3B1X3BtdV9kZWluaXQucGFydCBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jOjkwNQo+ICBrdm1fcmlzY3ZfdmNwdV9wbXVfZGVpbml0IGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmM6ODkzCj4gIGt2bV9hcmNoX3ZjcHVfZGVzdHJveSBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmM6MTk5Cj4gIGt2bV92Y3B1X2Rlc3Ryb3kgdmlydC9rdm0va3ZtX21haW4uYzo0NjkgW2lu
bGluZV0KPiAga3ZtX2Rlc3Ryb3lfdmNwdXMgdmlydC9rdm0va3ZtX21haW4uYzo0ODkKPiAga3Zt
X2FyY2hfZGVzdHJveV92bSBhcmNoL3Jpc2N2L2t2bS92bS5jOjU0Cj4gIGt2bV9kZXN0cm95X3Zt
IHZpcnQva3ZtL2t2bV9tYWluLmM6MTMwMSBbaW5saW5lXQo+ICBrdm1fcHV0X2t2bSB2aXJ0L2t2
bS9rdm1fbWFpbi5jOjEzMzgKPiAga3ZtX3ZtX3JlbGVhc2UgdmlydC9rdm0va3ZtX21haW4uYzox
MzYxCj4KPiBGaXggaXQgYnkgc2V0dGluZyBrdnBtdS0+c2RhdGEgdG8gTlVMTCBhZnRlciBrZnJl
ZSgpIGluCj4ga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1lbSgpLCBzbyB0aGF0
IHRoZSBzdWJzZXF1ZW50Cj4ga2ZyZWUoTlVMTCkgaW4ga3ZtX3BtdV9jbGVhcl9zbmFwc2hvdF9h
cmVhKCkgYmVjb21lcyBhIHNhZmUgbm8tb3AuCj4KPiBUaGlzIGJ1ZyB3YXMgZm91bmQgYnkgZnV6
emluZyB0aGUgS1ZNIFJJU0MtViBQTVUgaW50ZXJmYWNlLgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2Rk
NzU2ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBTQkkgUE1VIFNuYXBzaG90IGZlYXR1cmUiKQo+
IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8amlha2FpUGVhbnV0QGdtYWlsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4KClF1ZXVlZCB0
aGlzIHBhdGNoIGZvciBMaW51eC03LjEKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfcG11LmMKPiBpbmRleCBlODczNDMwZTU5NmIyLi5hYzFiOWE5MWExOWRiIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gQEAgLTQ0MSw2ICs0NDEsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X3NuYXBzaG90X3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
cwo+ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkg
YXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gICAgICAgICBp
ZiAoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0YSwgc25hcHNo
b3RfYXJlYV9zaXplKSkgewo+ICAgICAgICAgICAgICAgICBrZnJlZShrdnBtdS0+c2RhdGEpOwo+
ICsgICAgICAgICAgICAgICBrdnBtdS0+c2RhdGEgPSBOVUxMOwo+ICAgICAgICAgICAgICAgICBz
YmlyZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
