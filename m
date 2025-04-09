Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429EBC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbRFbUF88Iyc/o30lj91DOtogJOWS9ybmM2fFIY1oEQ=; b=2FDqfA7+WkNXwi
	h99M4m9ZHG0Jdx/fPOgFyi2LhmwTSPf4kWiho6HZpKwc96C+z+e6QmnSSzw424ZxkayLI+3dH9FWk
	esC0o3g3wZUSUO4Ga2mRGnRqHU/UWuCFKxa8TBkUwyLU+unfL4idHtJb/ggoLDE4+DW1FYpXCNWBB
	Vvyj4LoS/1ryi2wYOxAFhxr4F03O/2vpQpcpgfpJM/V0Tb/3GEHZxO60aPYZ8X5+3VDRK0iD2VRkW
	Lu3pw8cYn4QkNbSiskyi42bLLi8lKr6VZ/GntkUUx3GZxThRVilZwCSA0EI7yucBKfjKjSD6JHnHu
	RYi+D2pgX6XdM/fADE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2apf-00000008HHr-2Mk5;
	Wed, 09 Apr 2025 19:11:31 +0000
Received: from send266.i.mail.ru ([95.163.59.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2apb-00000008HGM-1Sys
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=84UBC03hNCb13+HyRaHqv/Gf1Qk28Q4O2obKNbI4KFY=; t=1744225884; x=1744315884; 
	b=RGX6tG2SEkYFob5LbkToUwNwpAr8bqX9mfhuGjDn1rmi8pmFLI94mH5GAIrTm+kY/g8kVUA0R7p
	/kb1vvr8wG7nCWJ4GjEsDmOmXQO5WvKmeE7XkWqn/rG1IG2lF17wOPH7L1AGwgpDHhlxPCrJDloeK
	qG+jgCHFXzFusD6CPVzZwuYEI8O474VIJ0IgefXEg33XjOm7qycbpWrWncnLouoRVfO2g/wJVUmnG
	wfECHn4hADy4pqHks+m1RNrnk2zSK8DxAShncsr9FtyaE51vNWek6aRU9zNLThOPfTDE19n3Gz9Bi
	0K4TwyYoRPJB8z4Lyc+zPMeCe/f02HnThLlw==;
Received: by exim-smtp-85ff495cfc-pbccc with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u2apT-000000002uu-1LK8; Wed, 09 Apr 2025 22:11:20 +0300
Message-ID: <c11d39bb-cdb8-45f0-95cd-283e7cc6aff4@inbox.ru>
Date: Wed, 9 Apr 2025 22:11:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Amma Lee <lixiaoyun@binary-semi.com>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
Authentication-Results: exim-smtp-85ff495cfc-pbccc; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96AB534CA17E18E8F0A3910F3FACDD3ABE247BFD61724D6D6182A05F5380850404C228DA9ACA6FE27F559D9661971D0633DE06ABAFEAF6705B516B0159FFEB1245581499C14029E4892B1A6A82314B74A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D9C4478D0B876341EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373768BF035B57E5168638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2C264463944ADC3AF2E070BE324C7D3C4737E40CF06D14244BB0A4F435E46E6718B35066C979671628AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C04A3B2F4BA56A4D558941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B605A8BD9291DE3CBBCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5D2C5362076D858755002B1117B3ED696EC201ACD4C4FE43D957033528158102E823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34A08F09726D78E07B05CE5DE609FFDC6A1A883DA2B18F73D5BC77801A7008F6053FCBC04C6AF4AC4E1D7E09C32AA3244CEF0E5157C137FD2077DD89D51EBB77427457E7BBCDCF6C79EA455F16B58544A239EFC82C7514BDDC5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5t2eaDMAwOw4=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6139DF3AADA6965A8B4E9B47FDAE4E847BBFB7C714878DA8290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_121127_718590_D1B91BC8 
X-CRM114-Status: UNSURE (   4.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MDkuMDQuMjAyNSAyMDoxNCwgU2FtdWVsIEhvbGxhbmQg0L/QuNGI0LXRgjoKPiBUaGUgY3VycmVu
dCBjb2RlIGFsbG93cyByZWxbal0gdG8gYWNjZXNzIG9uZSBlbGVtZW50IHBhc3QgdGhlIGVuZCBv
ZiB0aGUKPiByZWxvY2F0aW9uIHNlY3Rpb24uIFNpbXBsaWZ5IHRvIG51bV9yZWxvY2F0aW9ucyB3
aGljaCBpcyBlcXVpdmFsZW50IHRvCj4gdGhlIGV4aXN0aW5nIHNpemUgZXhwcmVzc2lvbi4KPiAK
PiBGaXhlczogMDgwYzQzMjRmYTVlICgicmlzY3Y6IG9wdGltaXplIEVMRiByZWxvY2F0aW9uIGZ1
bmN0aW9uIGluIHJpc2N2IikKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4KClJldmlld2VkLWJ5OiBNYXhpbSBLb2NoZXRrb3YgPGZpZG9f
bWF4QGluYm94LnJ1PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
