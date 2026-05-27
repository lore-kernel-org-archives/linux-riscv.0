Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22344CD5BDE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 01:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUzVlD7asoX05etBQSJ5xdodkgENkfrDiVLTipPEYUo=; b=iojAZvXNl7enCT
	mPgeReRt/xIM9flYRMgeZRx2/D2/AQL4TL1dFK87cQ/B0r3tXq17bHi9Udsv89itTUZIip6rCIWeB
	aun24XOEYMLE5yhAVRsj42WNBQtRJBV+noVFlN9Zmiq0Lz/RV7fyxN7Dy3Q3t8sXM2Rt0M3Hxogif
	t8hcVXnrfj1/CUe7s6xsYm7OO/Yqj+ZZgCqPDcBl4frDn6lsUMDhQgPJl6XEQfgru5qtb+QtdHzAE
	Y03ub+8nzorQ3kuXfG+o4TWmd5viMKvzU6KXy3JSOGrB5HmUj0TsCGEU038ImdLJf4vB4GPZYAU/Z
	pQCiYmPPF4we6VIzpCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3DK-0000000389B-0osp;
	Wed, 27 May 2026 01:37:42 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3DH-0000000388r-1bXL
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 01:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=hCqBUCXovA5qatFwbDA89zsE15dhry2it
	1Or3zG4G6U=; b=UAYq4OJVZONQVr4MdOkrv2w7uMCPz4n3r7FU6uFAx4ucEjoZh
	A5WBp3m7rbSxGMSOJqlNJ4i1mPYHELCnKiKImSWBue6SQWdleudQFbRScs7rDcWy
	P4rfQ4NPxQuR7U2Nzg2z/4pPLGE0sMpUD6eu5X34vjs/7g3HnfIgYBf9D4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUL9ShZqJEQGAA--.7868S2;
	Wed, 27 May 2026 09:38:05 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
From: Jia Wang <wangjia@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
 <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
Date: Wed, 27 May 2026 09:37:25 +0800
Message-Id: <177984584580.2389245.17509091079717184088.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779845846; l=433;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=2P86mk3pv0uwteCwZB11+2x+psW1tPWVHfVVdaiYzcs=;
 b=xa0uVt8IVP2LldTfzER2o+wVAHR1EpbeF3DOs4wWU6xzCFBekge/b3JD5uoj96lqnqPINencF
 HGJ1VRSZ3ppDQNx9UgdxADZjxgSZb1J5NX+JzVmFc5cOUl8HIcqtIqx
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwAnYUL9ShZqJEQGAA--.7868S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYG7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAqzxv26x
	kF7I0En4kS14v26r4a6rW5MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU122NtUUUUU=
	=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoVGMYADgABs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_183739_750316_E9774EC6 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyNi0wNS0yNSAxMToyMyArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBGcmks
IE1heSAxNSwgMjAyNiBhdCAzOjE44oCvQU0gSmlhIFdhbmcgdmlhIEI0IFJlbGF5Cj4gPGRldm51
bGwrd2FuZ2ppYS51bHRyYXJpc2MuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4gKysrIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3VsdHJhcmlzYyxkcDEwMDAtcGluY3RybC5oCj4g
Cj4gTW92ZSB0aGlzIHRvIHNvbWV0aGluZyBsaWtlIGFyY2gvKi9kdHMvdmVuZG9yL2RwMTAwMC1w
aW5jdHJsLmR0c2kKPgoKVGhhbmtzLCB0aGlzIGlzIHBhcnQgb2YgdGhlIGxlZ2FjeSBhbmQgd2ls
bCBiZSBkcm9wcGVkIGluIHYyLgogCj4gWW91cnMsCj4gTGludXMgV2FsbGVpago+IAoKQmVzdCBy
ZWdhcmRzLApKaWEgV2FuZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
