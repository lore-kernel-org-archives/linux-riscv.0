Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4CC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMqHUMFc1ELQeAdkP8AIP7zNf5OJnHCP1pvY8BMrHug=; b=oX+OOTsvIR/eU6
	lKSBaJHPVzFytaSSZYn/BooXv0vqFLhCW09MAmwjsbes0IH/G35rzBU2bsil1PB0SY+h4t+m6bhOQ
	PqDH+cU+JdOWme0KKuT9yTIiSrdJ7epETGGE4tP7RNgoV3yReAoGZDmHjGcSzFbJYmdXRgzTNGG6P
	2LNCCBbLub1IPCVGoIcnQwRfg6Ow7OZJ4xJvKB/GkaCAG1Cy8MIff4RAREtU18qC6Ztx3cMYmdcvm
	+LbMQ9J/uE0N3Bbr8xD+mAz3r3mFoiDgHBAW807P8eZgGOUayS5zc7HWAJmXSKAT8cREF8K27tT7L
	7v6ojdNMCVC98J3A1PiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZT-00000008QJI-0qNf;
	Wed, 27 Mar 2024 10:31:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQZN-00000008QEx-32Op
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 10:31:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a4751063318so438231566b.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711535496; x=1712140296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSJ+UjWyV6VDqHK474kxHesTXDBqeer09Qi3VieNTqM=;
        b=HcVSs1THQ5QnhqYRq9dV4xZDn0uwbYejwqyifaQyRtsMwPJHHsiGF14MXg2UktZJPi
         +AT9CcyuJVcScKn617NT80OHi80ErgDT59a9apQBXNenzhAoCPdsKE+qg2/SUJjiIbwh
         zVC0eC/a4h3uqi2/JieSYrJFN6T97MLJ3H6qhA/80XHYCaukVOiEZ3aHaoICg7ziu9cp
         Y2diu1aPvZ5IyEJWXabS7ZLJlzrJtdVHWd7RN/3Eu1iVC90wdm9WeLM346/xxAwQHTtY
         YWQCtseQh/p287nWNEzQs3p8KTFX8T0e4uVom+GFv0iVDJ3d8DyEUN4nV64mUm0Mf1xU
         MkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535496; x=1712140296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSJ+UjWyV6VDqHK474kxHesTXDBqeer09Qi3VieNTqM=;
        b=YPOrD4EFqHXXOIcKjWXswnxZHhwqmbzrii073QQKvP0tHLsGqTTfVnWOU/Bn8LxfLZ
         L7brDtwdXvk2igEYyNe36VA6HDzQqP3FhYvcUFqNQpttwyp02f9xZUP0ZlpyAICPItY2
         28Kxt+DHx0FyS4j8w4Qk7oIuD5SZnpS7sSEM8kEWjSWO62ZPbw+V1KgNm6c5nFLc9MWs
         ui/kLAzHYv2u0IrJOGNFoOW5EyvJc1gaEUsR2LGZXfkPSbc90QyOMro+cXXfuE1Z7dCt
         yH+j5dhdmjKPZz6LuYHEVJZkQa2F6nk2/WYuxCaDPEi1PHTm6fu+ZYufm2Vw/0Ctw4yR
         gDLQ==
X-Gm-Message-State: AOJu0YxhYQacYfYrbdB9496bsCJhtfVxkecYu0YjNrtkewFiF3NR3CMB
	XiLqKIyGZnh1ku7GfBuCW5gM5vJDa9sb+s/bwg+EhSXP7MZNuKS+6C0G4Bdf1z4bK3XQLzJh6nu
	kqW4=
X-Google-Smtp-Source: AGHT+IGVZKrHhMNC1CQHMp/4kkiEfUCOZuadD93YT7eU77ZwO7kZVT2ezcq9jl6faw5E8GtW+3460A==
X-Received: by 2002:a17:906:6b8e:b0:a46:e595:f357 with SMTP id l14-20020a1709066b8e00b00a46e595f357mr2781223ejr.9.1711535496207;
        Wed, 27 Mar 2024 03:31:36 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906270f00b00a46b8cd9b51sm5294078ejc.185.2024.03.27.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:31:35 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 2/2] riscv: T-Head: Test availability bit before enabling MAEE errata
Date: Wed, 27 Mar 2024 11:31:30 +0100
Message-ID: <20240327103130.3651950-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_033145_815585_EC2B04B0 
X-CRM114-Status: GOOD (  14.01  )
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

VC1IZWFkJ3MgTUFFRSBtZWNoYW5pc20gKG5vbi1jb21wYXRpYmxlIGVxdWl2YWxlbnQgb2YgUlZJ
J3MgU3ZwYm10KQppcyBjdXJyZW50bHkgYXNzdW1lZCBmb3IgYWxsIFQtSGVhZCBoYXJ0cy4gSG93
ZXZlciwgUUVNVSByZWNlbnRseQpkZWNpZGVkIHRvIGRyb3AgYWNjZXB0YW5jZSBvZiBndWVzdHMg
dGhhdCB3cml0ZSByZXNlcnZlZCBiaXRzIGluIFBURXMuCkFzIE1BRUUgdXNlcyByZXNlcnZlZCBi
aXRzIGluIFBURXMgYW5kIExpbnV4IGFwcGxpZXMgdGhlIE1BRUUgZXJyYXRhCmZvciBhbGwgVC1I
ZWFkIGhhcnRzLCB0aGlzIGJyb2tlIHRoZSBMaW51eCBzdGFydHVwIG9uIFFFTVUgZW11bGF0aW9u
cwpvZiB0aGUgQzkwNiBlbXVsYXRpb24uCgpUaGlzIHBhdGNoIGF0dGVtcHRzIHRvIGFkZHJlc3Mg
dGhpcyBpc3N1ZSBieSB0ZXN0aW5nIHRoZSBNQUVFIGJpdAppbiBUSF9NWFNUQVRVUyBDU1IuIEFz
IHRoZSBUSF9NWFNUQVRVUyBDU1IgaXMgb25seSBhY2Nlc3NpYmxlIGluIE0tbW9kZQp0aGlzIHBh
dGNoIGRlcGVuZHMgb24gTS1tb2RlIGZpcm13YXJlIHRoYXQgaGFuZGxlcyB0aGlzIGZvciB1cwp0
cmFuc3BhcmVudGx5LgoKQXMgdGhpcyBwYXRjaCBicmVha3MgTGludXggYm9vdHVwIG9uIGFsbCBD
OXh4IG1hY2hpbmVzIHdpdGggTUFFRSwKd2hpY2ggZG9uJ3QgaGF2ZSBNLW1vZGUgZmlybXdhcmUg
dGhhdCBoYW5kbGVzIHRoZSBhY2Nlc3MgdG8gdGhlClRIX01YU1RBVFVTIENTUiwgdGhpcyBwYXRj
aCBpcyBtYXJrZWQgYXMgUkZDLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxj
aHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0tLQogYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQv
ZXJyYXRhLmMgfCAxNCArKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhl
YWQvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwppbmRleCA4Yzhh
OGE0YjA0MjEuLmRkN2JmNmM2MmEzNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhl
YWQvZXJyYXRhLmMKKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKQEAgLTE5
LDYgKzE5LDkgQEAKICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KICNpbmNsdWRlIDxhc20vdmVuZG9y
aWRfbGlzdC5oPgogCisjZGVmaW5lIENTUl9USF9NWFNUQVRVUwkJMHg3YzAKKyNkZWZpbmUgTVhT
VEFUVVNfTUFFRQkJX0FDKDB4MjAwMDAwLCBVTCkKKwogc3RhdGljIGJvb2wgZXJyYXRhX3Byb2Jl
X21hZWUodW5zaWduZWQgaW50IHN0YWdlLAogCQkJICAgICAgdW5zaWduZWQgbG9uZyBhcmNoX2lk
LCB1bnNpZ25lZCBsb25nIGltcGlkKQogewpAQCAtMjgsMTEgKzMxLDE0IEBAIHN0YXRpYyBib29s
IGVycmF0YV9wcm9iZV9tYWVlKHVuc2lnbmVkIGludCBzdGFnZSwKIAlpZiAoYXJjaF9pZCAhPSAw
IHx8IGltcGlkICE9IDApCiAJCXJldHVybiBmYWxzZTsKIAotCWlmIChzdGFnZSA9PSBSSVNDVl9B
TFRFUk5BVElWRVNfRUFSTFlfQk9PVCB8fAotCSAgICBzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElW
RVNfTU9EVUxFKQotCQlyZXR1cm4gdHJ1ZTsKKwlpZiAoc3RhZ2UgIT0gUklTQ1ZfQUxURVJOQVRJ
VkVTX0VBUkxZX0JPT1QgJiYKKwkgICAgc3RhZ2UgIT0gUklTQ1ZfQUxURVJOQVRJVkVTX01PRFVM
RSkKKwkJcmV0dXJuIGZhbHNlOwogCi0JcmV0dXJuIGZhbHNlOworCWlmICghKGNzcl9yZWFkKENT
Ul9USF9NWFNUQVRVUykgJiBNWFNUQVRVU19NQUVFKSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0
dXJuIHRydWU7CiB9CiAKIC8qCi0tIAoyLjQ0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
