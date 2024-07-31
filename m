Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DA0C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxV5h61OhCN+8yITfLgCVYQjHqyACr84UzBsjaI1DZ0=; b=dADoZNb4cu47HU
	63LIuEa+FdNq5kk3Ld/6SoPA1TiYlTaG3NSY7k3ENy7K0vtANExfvI1M+ub4RLwxTfKdu6jQCsgc7
	yyvv2gV7tNLlv/Ps85f0Q0S1bMWus0KsQKbQk+85ioDV96du/81DLU6ZWnDfgnvCf0ogruteB0VfL
	PTyX123kF44gLRdTBfHBBXGcYaRkPYtoPI0R/El8GVj4zHfakJZnVWoJDHNud5bJCVjSi+GLoCsTi
	EWzK5/lv+qZr1JiGm9mb0BYhegMlvqD9BygRq7XjAgRFjRrcN0ZHALL+zhoGPcXpcSDecSWERPxdi
	jAuyBBPFlR1vWX4a1IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4an-00000000Igb-41z9;
	Wed, 31 Jul 2024 08:21:53 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4ah-00000000Id8-195d
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 08:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722414069; x=1723018869; i=markus.elfring@web.de;
	bh=7IHJECVa2WSvDCuY4TKIZrawhtfEM/UnUttBhMFbPUc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aIWB1GtDJXvIL8UnjVARHO30tm66q5fVCu6+EuiK6zphh5w/B1m0A/XoT8BO56z4
	 FVFITM2d3zJqqMi5OzFcegk4tyZFc7k47RznY4UBDxSZuwCSw3LL65QrGPHq30nCg
	 cC49WVWTbLGZZuwf5nAK9kVaZHaXJ1u7VaKadBAsczyDprnhY1QhkYMI9OlvEaEQT
	 zaCzO/4sBUKswQ1QfwQJ2lXIpGwXaMcDfXV4XlinqMgyJ4NSRMZI1NSYeCZ7NBPN3
	 9eQS1+OzENjzrsg5DjG+cwkN04MFwhAiEsMKs9QL+Jc31sFRNwh+MdMdY7cS7wWQc
	 +1gSrP/ATyCTJK2Clg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLii-1smhPD0iyw-00TqyM; Wed, 31
 Jul 2024 10:21:09 +0200
Message-ID: <b42db5e1-102c-4ab7-b439-75301c8c27de@web.de>
Date: Wed, 31 Jul 2024 10:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
To: Inochi Amaoto <inochiama@outlook.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>
References: <IA1PR20MB4953438ED600110E71F9D092BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
 <633f5f40-481f-4063-ab5d-f383e981b0fe@web.de>
 <IA1PR20MB4953FE2F603D5D23175D724BBBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <IA1PR20MB4953FE2F603D5D23175D724BBBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Provags-ID: V03:K1:O5gOmYj/plL6GKTb2Trz6dd8+mGBkcchYhTTkeEn05GQ+fpCoz4
 DiRnr8TSMY2NSp/I6pF45Yfp76oh5s2YdjKqMdTZjj85S+LbgGM21bEhnUOEKFoXLhIpQG0
 hr5l2aG781QmGrqDSvCvrVAHfSd5Z9RLS1nOP6Ss09mufLNIBDG+zTzuUis2EbemS9qGOA7
 YUO8npC67caK9ORX3lxbA==
UI-OutboundReport: notjunk:1;M01:P0:4lOiIrPRq14=;NfFfNnZc6pGLDP2lXsb9xWkvgsK
 Lb5/YepfTYup4hqYjdgjhOw42q/2PfX8Vns+F+FvtHa4haIQstcuicKTPsoBob1rOh1KKSA5x
 xE8PGlt+WUPWv5Kfsgf2AjPWDy3fZNsVgShr553dOGG7ZLfGfpw2/MhER7HusGDwMyp0VXbeI
 wIrvyh/UXrp2GMXnLwzaAU7osCjzX6DLWAVE+V2ZBTEfcDBbHbjekYzL9s5p2mZtmaSXKlzYU
 dJ68YupI29fEdL/sJO6eBQHEQwZFNU5VzWhW1U4Vl29VyUPfVm19kPZrPmvgcH1cH/7Xcfr6y
 MqwYP6+Yu8IoO79sp/5epSJya6c9EGcnntSwJfP6aINoA5CjFqrTiMyyf1NjrRsobyB5oplzY
 2u4aYBkRU+SymDLsUxqtZhzTplZc62VWYfjWiqZEYRKL8uS/GJ+LOOVtX7XK0A7C9XHsz6/mE
 ZCocwqGE4EAK6ZJ11XpmirLijGyACuRmGFAF3FzOTsoZoaCzxwMB0eIPOdRoP/5qsvskcsPs3
 +g2qmcEjAQ6PVFPpOmhC/5xoYpdrjDBy/8tX/BfDmlAfvOkJPjZFed1rKXWECMm17hYb8nUPh
 xLVJ2kalkvFw7veCd3PSysuGNb3r4quLWw8033Ntm0HmnCkld66VDMbKxr7Y61jVg1OjlB0p3
 POpEtt9qf50/WtvoOXIp0a0hzXu/B+FXjzEdL9VCmJ3RDPmYExpzQr79rz5YG74hgLZ7AkSRD
 38RqNmo3oyuLDJVbPn7Du7DyMBNLQNmRHmaEyWfRyFmaFu3TNpIGWH41iryWpjvMgv5RdHF+E
 IfRdXn9sz45jLpriW1XMByTQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_012147_702887_E86EB3AC 
X-CRM114-Status: UNSURE (   4.95  )
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

4oCmCj4+IFVuZGVyIHdoaWNoIGNpcmN1bXN0YW5jZXMgd291bGQgeW91IGJlY29tZSBpbnRlcmVz
dGVkIHRvIGFwcGx5IGEgc3RhdGVtZW50Cj4+IGxpa2Ug4oCcZ3VhcmQoc3BpbmxvY2tfaXJxc2F2
ZSkoJmRtYW11eC0+bG9jayk74oCdPwo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xMC4yL3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmgjTDU3NArigKYKPiBUaGlz
IGlzIHZlcnkgdXNlZnVsIGFuZCBJIGFtIHByZXR0eSBpbnRlcnN0ZWQsIGJ1dCBJIGFtIG5vdCBz
dXJlIGl0Cj4gaXMgc3VpdGFibGUuIENvdWxkIHlvdSBzaGFyZSBzb21lIHRlY2huaWNhbCBkZXRh
aWwgKG9yIHNvbWUgZG9jdW1lbnRzKQo+IGFib3V0IHRoaXMgbWV0aG9kPwoKRnVydGhlciBhcHBs
aWNhdGlvbnMgb2Ygc2NvcGUtYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudCBjYW4gYmVjb21lIG1v
cmUgaGVscGZ1bCwKY2FuJ3QgdGhleT8KCldvdWxkIHlvdSBsaWtlIHRvIHRha2UgYW5vdGhlciBs
b29rIGF0IGNvcnJlc3BvbmRpbmcgaW5mb3JtYXRpb24gc291cmNlcz8KCkV4YW1wbGU6CkFydGlj
bGVzIGJ5IEphdmllciBDYXJyYXNjbyBDcnV6CkxpbnV4IEtlcm5lbCBEZXZlbG9wbWVudCAtIEF1
dG9tYXRpYyBDbGVhbnVwCmh0dHBzOi8vamF2aWVyY2FycmFzY29jcnV6LmdpdGh1Yi5pby9rZXJu
ZWwtYXV0by1jbGVhbnVwLTEKSnVuZSAyMDI0CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
