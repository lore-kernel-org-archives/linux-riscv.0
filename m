Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AF606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUu063HE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3bXTeYaAX+T9EZVHQeZ5/Li+v8PU2lHx6NGdR+PwxFE=; b=bUu063HEAe1x1shwz0/HTUaZyV
	TOVh4IuvUg91b6ktZIQ0ynVvPIDIcYBJoH+lfVZ7UdO+qWP55ALHQ+7UUsDQq1bgRE2v/OaNOpEw2
	8aUBUUMZjYqZoJyDZVXHNc4qXqp37YilT0q811SnHqjP0htMpmINHVRlJnRpn2VQlBGNB/wGG+1i5
	TW00AWi7ethekjXGAbzAhDEGLnMrppOZlTNnAjzxdBgXqJ+0xpTRdz5Eh8A37uSWtsSANCdSrJBu2
	IPXCnKpH9JptkaCZXlVb/JaVe1zmnxyEV8vsKaBGJ8xKszM/PBs9/1Cy4iUSJXeurJDpenT7cGefZ
	HsE18kCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWs7-00000004oj4-0J5V;
	Wed, 04 Nov 2026 09:01:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWs1-00000004ogL-0ssE;
	Wed, 04 Nov 2026 09:01:28 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-01 (Coremail) with SMTP id qwCowAA3YPpe9OpqUE9CAA--.34579S2;
	Wed, 04 Nov 2026 17:01:20 +0800 (CST)
Message-ID: <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>, Drew Fustini	
 <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Han Gao
	 <rabenda.cn@gmail.com>
Date: Wed, 04 Nov 2026 17:01:17 +0800
In-Reply-To: <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
	 <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3YPpe9OpqUE9CAA--.34579S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4DGw45KFW5Ww1UKFWkXrb_yoWfKrb_u3
	Z8Zr1a9w4Iq3s3AFs8Kr4DWF4DK3yYyw1vvry8Xry3C34jyr4ru34DGw4Fyr15ZFZ8GF1f
	Crn3ZayrW3y7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_010125_624159_80D95D19 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMDTkuInnmoQgMDk6MjYgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ
6YGT77yaCj4gT24gMDMvMTEvMjAyNiAwOToxNCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+IFRo
aXMgcGF0Y2hzZXQgaXMgc3BsaXQgZnJvbSB0aGUgIkFkZCBUSDE1MjAgVVNCIHN1cHBvcnQiIHBh
dGNoc2V0LAo+ID4gd2l0aCBvbmx5IHRoZSBQSFkgYmluZGluZy9kcml2ZXIgcGFydC4KPiA+IAo+
ID4gSWNlbm93eSBaaGVuZyAoMik6Cj4gPiDCoCBkdC1iaW5kaW5nczogcGh5OiBhZGQgYmluZGlu
ZyBmb3IgVC1IZWFkIFRIMTUyMCBVU0IgUEhZCj4gPiDCoCBwaHk6IGFkZCBhIGRyaXZlciBmb3Ig
VC1IZWFkIFRIMTUyMCBVU0IgUEhZCj4gCj4gCj4gQ29uc2lkZXJpbmcgaG93IHZ1bGFiQGlzY2Fz
LmFjLmNuwqBpcyBpZ25vcmluZyByZXZpZXdzL2NvbW1lbnRzIGFuZAo+IHNwYW1zCj4gd2l0aCBh
IGxvdCBvZiB1bnRocmVhZGVkIGVtYWlscywgY29tcGxldGVseSBkaXNyZWdhcmRpbmcgYW55IHRy
aWVzIG9mCj4gY29udGFjdCBvdmVyIGxhc3QgMS41IG1vbnRocywgc2hhbGwgd2UgaWdub3JlIGFs
bCBjb250cmlidXRpb25zIGZyb20KPiBAaXNjYXMuYWMuY24/Cj4gCj4gTWF5YmUgdGhpcyB3aWxs
IGJlIHRoZSBvbmx5IHdheSB0byBhY3R1YWxseSBiZSBoZWFyZD8KPiAKPiBJY2Vub3d5LCBkbyB5
b3UgaGF2ZSBhbnkgcG9zc2liaWxpdHkgdG8gcmVhY2ggdG8gYm90IHNwYW1tZXJzIGZyb20KPiB2
dWxhYj8KClVuZm9ydHVuYXRlbHkgYXMgSSBhbSBub3QgaW4gQmVpamluZywgSSBhbSBub3QgYWJs
ZSB0byBwaHlzaWNhbGx5IHJlYWNoCnRoZSBwZXJzb25zOyBJIGhhdmUgcmVwb3J0ZWQgdGhpcyBp
bmNpZGVudCB0byBteSBzdXBlcnZpc29yIGFuZCBJIGFtCmFsc28gZmVlbGluZyBxdWl0ZSBiYWQg
b24gdGhpcy4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
