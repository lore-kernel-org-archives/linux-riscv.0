Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13487D66BB3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkSqBNV/+h39ZYuR74Uhv3EydrP778ljfXOYUEyubwU=; b=jsjmCFlbRbgWNAL1UiCfs3FOz3
	JqaN522HsvHVHpCi1atgIQ8wQxG/J/sWqhfZLwH95imFDW1mmugQr/EvlJ3LByUg7o1/gKOoFVW64
	CRKdTvf0bP4iXorqC2f8m8VR+UTLUSjR8UYMO0ezKQiEQacTzYEkWR22GPVJ41+XrcGyRgwxroGqG
	s3SC1Nv8b9YlLqaixbjnYRBtrWI/46EqdPQJmByKYPBTeqTJKGMfR+xTsIBqOA+uFu3PfGn+HxZJy
	29nOFgsaamhB+tWubauPwLw4IOJMwsLUPrjpCQBt+MqJJZjrIczoN0gEZn0oWIuIwlvE/6F/GCt9B
	RUbeguiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6Vi-00000007qCt-1i2k;
	Thu, 18 Dec 2025 05:25:10 +0000
Received: from fennec.ash.relay.mailchannels.net ([23.83.222.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6Vf-00000007qCR-3hzX
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 05:25:09 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1B91F821484;
	Thu, 18 Dec 2025 05:25:06 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.108.213.181])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 254E38211E9;
	Thu, 18 Dec 2025 05:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766035505;
	b=ZOZndSjG6GhLZ0Y9DXJltlMLQOpapQimB0xoh9a6eOjN7V/sgw7ZJOA6qq9MVPieEx+lG0
	TxGeTvr4ArmAuPoOPGx08uWaLS6AoyDyOftL18rWa6rxEIQOEb8gKoduRA89Wwv8KcC3g9
	hzWfjgUtKLUJSCeUjpm5TNPEsbbBXE1R7kvaRy7EwF3EvZ7zFoZ0PK3rMEJKLuL/xN6QvQ
	9b5snecjr04TRoZq3zUc/OLc9BBCGJdINRJLsTbOmHXIdHqTME6cYfTjjycOKoxtVVQATH
	XoR88RXyJcG94szI7Tzo/GIagz0U2NB/d5k6zKm3EM6JGR314gDWmvUoa2aOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766035505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=urIdvOKE9IoKEH1mnEpP65trf21mUReHnkTsYihVf1s=;
	b=kM8FOwDITPcdx0MdOctkWvWmd2rToaWELAK7+1PbMvxUmeKkdVkye7/JmeJFTVftmKys8a
	1AYhLMpRHaIHagCPlZYSiG3lm+C4H1YWIQJIDAc47k/QMe81hh+FSC4lylF7Z575rbRAms
	Up4lWJSZ2zFOjvGAtty70xEnf/Y1tmF2k1NJghRdt1b3bNG4Vf1S3RL+Om0xVMHYS5hTvn
	tOkj6nyMIDd4Ab4eh3qzdfmwfF2p3qZfBuJbAisbyjCwb8dunghRlFOJEXRPVnK7O7K5eI
	SjmGPtLIQ9Sgk6LVVVELHx3tnvRkdKxyAhe9ZtnVLDPwUWftlvKN7cZsiUNGXg==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-dzfg8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Eight-Print: 4f585c8726d26867_1766035505964_1333287826
X-MC-Loop-Signature: 1766035505964:1420442719
X-MC-Ingress-Time: 1766035505963
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.213.181 (trex/7.1.3);
	Thu, 18 Dec 2025 05:25:05 +0000
Received: from [IPV6:2001:861:4450:d360:6f03:783f:9b5b:57c1] (unknown [IPv6:2001:861:4450:d360:6f03:783f:9b5b:57c1])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWzd946m0z3wpT;
	Thu, 18 Dec 2025 05:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766035502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIdvOKE9IoKEH1mnEpP65trf21mUReHnkTsYihVf1s=;
	b=f0A7TBvTM/71zN2GD9eYZQvlPSoi/byxGJUXJjs0x2E9D2tjfC8KN66GDMd7RiwFOWB9X+
	Dfr0Y0wEk645IbxHaogrPIhtJJTrd+XiEI38enfb21tae+Aa0cEh2iGMxIPTlFSOVIxMs7
	jnCt9ZTosaFHw2SYr0fKazZPHA+oXCDAoghoufePAcuGOMLTV/gdatEkGW/evBqTIgS8g0
	BtVIFmZtPv351F2bUOEB4BplAENeaTXuYsoamC7QJFfhroNcKpdQky0z/4YWUvpv1PJ1jQ
	hINVRNS8dBEq6PdH29sluYkXOQoRHk21rDkNu2dyqnG7WfRjhVRGEDZiOoP4aA==
Message-ID: <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Iker Pedrosa <ikerpedrosam@gmail.com>,
 Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Johannes Erdfelt <johannes@erdfelt.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
Date: Thu, 18 Dec 2025 05:25:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6943902e a=TJDTwvido1ACHfu3sFfMdQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=uFDut6XBOhzVI-v-qFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDWWmxv5IFLiCstey/NVEdTTLCJeVIprXPUSmNdHxNzHiYgsksFDNJD+jKa/ljM7ingQXCC9VVL1AgWs2CcNaYzyb9t/3t73iAnkwwQJUhLgluYobPWf JdThafXKRspOAje+xh9xGCpZSf1Y8wmhxN3XbQe0rguO6F3OVLwR3BtEJac2nDQpfoZuEQngPhJHmGT1mWgNoB2oCMwtUmV0PZUXqpD9V5tcNmFZBTDlnRYX V6/MD08JBN0XykOtYOxZhfN5uFD1iCR7MoTiI5JPhkzPe2exoazuv/4XWP40BCaGamDn4wDaUdl3UTPkAGcL45lwQ5z5Zi63MtHuI/b29xuTyyhneAgAfbOJ P24HqllxIAbX4UxAAz+LCDOiALq/CbvFnWVTWjDIbelonCyaFtu1nOcE4lVuaJWiGOXt4g+UiOfmsiWHdhxLK+7XCnoAhWPweG6O8dIcsB/3bUtGn//iibpo bINVx4f+QkYxxaeChDHrcem4wT14OKoj98A3SrGbDBa9fS3qUpJKFLANmxaSR8ZBraOUXh3R70MIFp/uypP9s4daqXhHdj691UFC+rBgipInF/3dUpOm5NYU NXxu9nsVUHupeK+IBLWUVwLj
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_212508_086136_F8B69426 
X-CRM114-Status: UNSURE (   3.10  )
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

Ck9uIDEyLzE4LzI1IDA2OjE5LCBNaWNoYWVsIE9wZGVuYWNrZXIgd3JvdGU6Cj4KPiDCoCogWW91
IHdvbid0IGJlIGVtYmFycmFzc2VkIGlmIHlvdSBhbHJlYWR5IHBhc3NlZCB0aGVzZSBmaXJzdCB0
d28gCj4gY2hlY2tzIDspCj4gwqAqCgpJJ20gdGhlIG9uZSBnZXR0aW5nIGVtYmFycmFzc2VkIPCf
mIUuIENvcHlpbmcgYW5kIHBhc3RpbmcgZnJvbSBKb3BsaW4gCm5vdGVzIGludG8gVGh1bmRlcmJp
cmQgcmVhbGx5IG1hZGUgbXkgcmVwbHkgdWdseS4uLgoKVGhpcyBtYWRlIG1lIGZvcmdldCBhIHF1
aXRlIGltcG9ydGFudCBydWxlOiBzZW5kIHRoZSBwYXRjaGVzIHRvIHlvdXJzZWxmIApmaXJzdDoK
YjQgc2VuZCAtLXJlZmxlY3QKCk1pY2hhZWwuCgotLSAKTWljaGFlbCBPcGRlbmFja2VyClJvb3Qg
Q29tbWl0CllvY3RvIFByb2plY3QgYW5kIE9wZW5FbWJlZGRlZCBUcmFpbmluZyBjb3Vyc2UgLSBM
ZWFybiBieSBkb2luZzoKaHR0cHM6Ly9yb290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
