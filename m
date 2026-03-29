Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D986FC97EE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwfXNeh/zxXsUF0LtJOSqUqgcIQJiRLZDrKG8VpCc5c=; b=TULtH/1iyOjiH9gav+ZRCcSTaF
	i+z3u6+IZIsdBNG1q/F8ckFhw0FA68RhKwyHWPzYL6nFWv1XQXEDdTwSU0/X4ZdunF5HroFTk1EhP
	bmxSz+8RmLrCiFFqZ0kyL1v1D4t//yePmO0L96J0w5+XhnTN/xXuN7/ij2tWxxjK2NVw8+G1nwGGu
	eldrv9tEG+daKy3TGkHXv4kAR0ZXf6lioGQVsSRbhyOQ+HH/h6DFfajwXQE2suZu40CCEQkAxPhFE
	F58hk2G5fqhkLDkmtccttLtIEKroLULdO5q6sQsblwljN6Dx5o8KBbSEbQiiXTsn9Ww5G1NAYBvhs
	wTuE/0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6xSa-0000000AKpy-3wZu;
	Sun, 29 Mar 2026 21:14:16 +0000
Received: from toucan.tulip.relay.mailchannels.net ([23.83.218.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6xSY-0000000AKpf-0X3i
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 21:14:15 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F31EA782031;
	Sun, 29 Mar 2026 21:14:12 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (100-115-142-207.trex-nlb.outbound.svc.cluster.local [100.115.142.207])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 42666781D73;
	Sun, 29 Mar 2026 21:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774818852;
	b=qnCrhcIGC8Lw81es3X+Wo+kvDxv2wQfsdScN7joLVtPMURpTVd4w+JTuYfy0cUo/OsIJq4
	I1Uvat/CgzppGnpkKbDkmbSBefardULMLWzIO5oa5MVYksCnLZrYOXh08CEiGJkgmEHfN7
	uPXKmIXuiwbcPFyR6Z8juDQicr5PO0SWD/gKbFBb/doqDTwbu9DqD1QFQXGIcrSugm+0qD
	F2OnM2mf36va2SU7qOFKGKH77Py7VHOV0T9ESHFkZIWgXW84/tL/IXYIlzEmjIYs8EMqf7
	O9r/uTbURlwJWEqF+IieFc1xv5imApyv/4njfuz9QlOOTWbGHzv1DwdY76NGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774818852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=GPwev3K04le/fHrBvu2yHCNEOwAhRmNyY8V1pFhjEoo=;
	b=ygZByoOuzD5iRzC4DFC0PxG0HF52mMxfISsaPS+AQIHF61Nq38tw8hSrlYFiiRwi/Bbs4J
	ZXYYrRGn6ako9BO+E+4Af8ZXB5GeDUfkmgw7LO6ApHFkLj/44m82B/trYROXX2ul9Gx06k
	fh1KT5nQwUk4H9Po65DGoHOwHJlDJJR8u56XM/R+V38J2WV38Qloi1pgZVA07e+MzJFQB5
	Vi/QEtzxU7AFx2Der9uOeWhCIg8nhKKUsjSrJ6nphAmJBhYutTPssKFGUtZ+ayLoS8hGAz
	w8qPvr4QYVD4ZanfrrQ/bFTeJCT458gVbT8aPSDZlMlPXtllB1Dn+FXel4EQcQ==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-x7clm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tangy-Name: 5fc9a91b1ddbd4a3_1774818852818_3566261675
X-MC-Loop-Signature: 1774818852818:96200595
X-MC-Ingress-Time: 1774818852817
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.142.207 (trex/7.1.5);
	Sun, 29 Mar 2026 21:14:12 +0000
Received: from [IPV6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d] (unknown [IPv6:2001:861:4450:d360:ead3:9cb3:74f3:aa3d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fkRvc2bSzz31wB;
	Sun, 29 Mar 2026 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1774818846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPwev3K04le/fHrBvu2yHCNEOwAhRmNyY8V1pFhjEoo=;
	b=MIvHivufLuO/Idc+f58AgoELDrebw2pLnpMxVkjtlioz1P1MEpgFvWZc8OrvD6hWHo17fC
	CvedMmz9sedDWDtknApc9OVGHytX+/jGzd+vVTlTeykX4q8+T/qNUuMo7VyPavnUxU+m7B
	cWw0jiKZHIzlMrcJOlCnfHX+hsDsprFtTpzZIZ6rnSMw7lnRYizpFV/cuAczwixCGOZWEn
	2h3FkuAnyTIbvxiAvdgq68x6WVkVaLbWUujACT2CI2cbz9rbO1HSHfpI0Jjazc9tVypGFD
	zdk2SmOEAb5ldERy3HwYS4Tn2ldWo0qj75Lcy6frAhsEcVh0x47y02f081u2Ew==
Message-ID: <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, unicorn_wang@outlook.com, inochiama@gmail.com,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
 rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
 anup@brainfault.org
References: <20260328173450.219664-1-josh.milas@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
Date: Sun, 29 Mar 2026 21:14:04 +0000 (UTC)
X-CM-Envelope: MS4xfL+Wo5DZjOaBh49EOaUutWGaQu0lfXl+Z/8jRHf+IPP3+63ghIrH7OqQdC2VYsijHziR+tcK+Fi1VVOgC0vCsbzGP0mMgWaUBlCjsRkEgdRDbugXMH97 e0NaTIN+ek9iOxYqUpxFz6fvHUE5pzFz0XSLc5BD+8uUWPLJZv8+0N+rlVwIKbU/HCoJpV07VrDOh4xnmjuMGxpgTjx26GUHQ92gYmzhJwO7/i1y3wcKXcen 1p8kAkbK42lU+pWFwE9vUZX88P3QW4EcgIjAUY4BuGyVzJTkS7zIMJ/2WtOtqhol31soyggtrpuJ3ksvhbzLpBKveuL0tHUXwD9B1541L3MMZrYX7ikQkTVm 7Vfmxd8nM11a0BidocThOXEIBR5XjrNOJ45TaGFWur42KoQyjo+MNXK82azp2se9UC5sqwoLp/Y84syPMXjcO2CTQlSVyUDlthsf3E3L8q0OGC6T3pFX9KKp iOokDHJ49XRKdryBioFP0n+VL1Co9JwLCcoyVw+LsniIKxXq3Yw+vARHuIuiPNimxQSLUCKdFLoQxXfyY6GkLRVn1KXUxpzTwUV1MAlm8V18YoXNBRAr0K1L WjuloXGE/xaXCgqwMvyvD9CfbhU40VRaZL1oVMtx0NgJ3X9xFJ0GSPzSVuucfxZ0Lnc/R71BHxN+GqyZ0YJAyixE1fICBJw7oa8ul8cdHkoFd2idI8ZgNjtq CmvHW4chMrzUeJED+K6ku1YJ3tdhbkEBW6SGR/XgHyPOrgYenIIks035wTVRBXtEPB1DqL98Pwa/qIH9A6k5qqocym9aKWPXDHCZOclRYMyGAsv7M6ij7t0m wlrG3jdarmBFxQmPfkv8+y6ZBz3nYxVVV2yBR/8NMC7XNKuHJIyDVc7J4oFCEtKvddop5KMHVEsUsvuUlyYJIP8BcXVLHMs2OHvMgkwGA9vji5X+9c0jQooj p6GfC+d5BUYuqkf
 TAaMtDpTmvuw+rFA2yLFOWCVVzr9XiVBkYuAGk8ye988dsSCbcnxk5D+E4lBn98mmYyqDJyBPOXo2TxS06AgJX/yL1hCwDKBU0h6am5lK qyNnSVw3TOtpDE/V/suLaPkP2brrmu8qs9ATKNB5+IGAsgJZ/KVT3Ztb
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69c9961e a=FriOl7xEJMI/2lIB2BrE0g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=8WpGhjpvk0lN6TuUIIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_141414_312801_59380B38 
X-CRM114-Status: UNSURE (   8.93  )
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

SGkgSm9zaHVhCgpPbiAzLzI4LzI2IDY6MzQgUE0sIEpvc2h1YSBNaWxhcyB3cm90ZToKPiBUaGlz
IGFkZHMgYW4gaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3IgdGhlIE1pbGstViBEdW8gUyBib2FyZAo+
IHdpdGggc3VwcG9ydCBmb3IgcmVhZGluZyBmcm9tIHRoZSBTRCBjYXJkIGFuZCBuZXR3b3JrIG92
ZXIKPiBFdGhlcm5ldC4gVGhpcyBpcyBjb250aW51ZWQgd29yayBmcm9tIE1pY2hhZWwgT3BkZW5h
Y2tlcidzCj4gdjYgc2VyaWVzIFsxXSBvbiB0aGUgQVJNNjQgYW5kIFJJU0NWIHNpZGUuIEl0IGhh
cyBiZWVuIHRlc3RlZAo+IHdpdGggQVJNNjQgYW5kIFJJU0NWNjQgdG8gYm9vdCBmcm9tIGFuIFNE
IGNhcmQsIGhhdmUgbmV0d29ya2luZywKPiBhbmQgcmVhZCBJMkMgc2xhdmUgZGV2aWNlcyBvdmVy
IGkyYzQuCgpJIGNvdWxkIHRlc3Qgc3VjY2Vzc2Z1bGx5IG9uIFJJU0MtViwgYm9vdGluZyBmcm9t
IE1NQyBvbiBhIGNvbW1hbmQgbGluZSAKc2hlbGwsIGFuZCB0ZXN0aW5nIGkyYzQuIEhvd2V2ZXIs
IEkgaGF2ZSBhbiBpc3N1ZSB3aXRoIEV0aGVybmV0LiBXaGVuIEkgCmFkZCAiaXA9MTcyLjI0LjAu
MiIgKGZvciBleGFtcGxlKSB0byB0aGUga2VybmVsIGNvbW1hbmQgbGluZSwgSSdtIApnZXR0aW5n
IHRoaXM6CgpbwqAgwqAgMi41ODY5ODRdIHN0bW1hY2V0aCA0MDcwMDAwLmV0aGVybmV0IGV0aDA6
IFJlZ2lzdGVyIApNRU1fVFlQRV9QQUdFX1BPT0wgUnhRLTAKW8KgIMKgIDIuNTk2NDI4XSBzdG1t
YWNldGggNDA3MDAwMC5ldGhlcm5ldCBldGgwOiBjYW5ub3QgYXR0YWNoIHRvIFBIWSAKKGVycm9y
OiAtRU5PREVWKQpbwqAgwqAgMi42MjczNTFdIElQLUNvbmZpZzogRmFpbGVkIHRvIG9wZW4gZXRo
MApbwqAgwqAgMi42MzE4NTldIElQLUNvbmZpZzogTm8gbmV0d29yayBkZXZpY2VzIGF2YWlsYWJs
ZQoKSG93ZXZlciwgImV0aDAiIGFwcGVhcnMgaW4gdGhlIGxpc3Qgb2YgbmV0d29ya2luZyBkZXZp
Y2VzLgpEb2VzIHRoaXMgd29yayBvbiB5b3VyIHNpZGU/CkNoZWVycwpNaWNoYWVsLgoKLS0gClJv
b3QgQ29tbWl0CkVtYmVkZGVkIExpbnV4IFRyYWluaW5nIGFuZCBDb25zdWx0aW5nCmh0dHBzOi8v
cm9vdGNvbW1pdC5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
