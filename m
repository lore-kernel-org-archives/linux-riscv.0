Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A287606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yRceYPJG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kfa4kPQu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swv6l/gFcxOn0jOuGx5dFlLCqEJepXyCH6wOrBTnzwo=; b=yRceYPJGraoHhtBYka/rPdkvLo
	eY+C8/pKbXZcC2Lu1Euk3ZiTRgKmKBdMFuERloh2NpFsD/YlUfwHPlxEaizf6eu4wP2zp5TlXrjYW
	qpfye8+06mqkhz/LVKAjINFLOe9etwhyAn24myighGofZHrheiRsXNRXu45AM1W49GfxbE742Kcxp
	+HIPRTjLNeFQURzasLLa4nuyvRYESs85C26Xni/Yfr5JLdb5CaWNAsYs2Vu3QTwYoX1BJpCQob5Xy
	6WXF4jOF+0NSbX1FG3kWLzhzmBLDNfFqARFY8aoZ5mx0/P/R6AtFRZ3bZYFSfuBd9cO1iacIyfVj1
	uw8dGDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU430-0000000CRqd-30o4;
	Thu, 19 Nov 2026 15:27:38 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU42y-0000000CRpW-2iht
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:27:37 +0000
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id Tml9xaZVJ4vCDU42xxi0S0; Thu, 19 Nov 2026 15:27:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id U42vxqAzT3nNNU42vx0ppz; Thu, 19 Nov 2026 15:27:34 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6aff1566
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=EUspDBNiAAAA:8
 a=nhoOZ0oBgXBQ0gkwPj4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8dhBqF+ImQqlLbq4kzeBiQsS0q4yocPVf6hddBwCahY=; b=kfa4kPQuYaEi
	bkxAKRdQU+dumcftE5MLvti7K1UJ7LHNIGWdmgboPKnleT5jvZkWbqx00pm1bYof6xvAmdIhN9hPC
	iAvq57U/tB0uw3wIoSH5Uc3lfpMpqSgsTE8d3EWyPs9K5rQoLPvllHzi/LsPG6HZmcKqjn2pXrDcO
	CSvRVJIHRU5UjA7FAYRbIM5WoAfG1roXl0kfxVNUPcuNFUkoNT0x2nMv8mCLFWel13Pd9y2DuO/+Y
	0ZEzWnkmfCAtA1+EgxkZ+59lRHH92e05jJJyMCnvqNzIqB5xFmX6oEBSLcMUFlU/ru3/qP16OB9g+
	VkOWyIeSXHvO9SYG/QF+cA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35428)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xU42v-00000002jcP-0paV;
	Thu, 19 Nov 2026 20:57:33 +0530
Message-ID: <10c7622c-4dc4-4ffd-89b1-0678e3553f53@roeck-us.net>
Date: Thu, 19 Nov 2026 07:27:30 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/2] drivers/watchdog: Add RISC-V SBI watchdog
 driver
To: Anup Patel <anup@brainfault.org>, Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 wim@linux-watchdog.org, radim.krcmar@oss.qualcomm.com,
 anup.patel@oss.qualcomm.com, linux-riscv@lists.infradead.org,
 linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com
References: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com>
 <20261118092147.2017658-3-prajwal.n@oss.qualcomm.com>
 <CAAhSdy2ZKBc8A522viUWZbn418MC-C2cy7pQYLBFYn4gsTvJ8Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAAhSdy2ZKBc8A522viUWZbn418MC-C2cy7pQYLBFYn4gsTvJ8Q@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xU42v-00000002jcP-0paV
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35428
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKxMzF4EF9m7wDniLZCYKoAKt1x3E9I323kwTegnk2Bkpt1wYZ4YNN65GKGmDik/2cpYmkbl32GMnFW+M3ApgNyCD36nVTTX9Ynp/0iCTtUNAnYYcolf
 gwGtzlDapE8S2lIuHxNKHRz7FwuH/Eiy+gyaz3iR9vqX8VkpqCpu2ba+Ap3e0CnOlQnnrg9WhJiBSB14UL0+Ofq0cKwHbyhhHdbJojLGbH55wHI83YNdZtjX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072736_754466_949457D6 
X-CRM114-Status: GOOD (  13.98  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTkvMjYgMDc6MDQsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMTgsIDIw
MjYgYXQgMjo1MuKAr1BNIFByYWp3YWwgTiA8cHJhandhbC5uQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+Pgo+PiBBZGQgdGhlIFJJU0NWX1NCSV9XQVRDSERPRyBLY29uZmlnIG9wdGlvbiwgd2hp
Y2ggZGVwZW5kcyBvbgo+PiBSSVNDViBhbmQgUklTQ1ZfU0JJIHN1cHBvcnQuCj4gCj4gS2NvbmZp
ZyBvcHRpb24gaXMgYWx3YXlzIG5lZWRlZCB3aGVuIGFkZGluZyBuZXcgZHJpdmVyIHNvCj4gdGhl
cmUgaXMgbm90IG11Y2ggdmFsdWUgaW4gaGF2aW5nIHRoaXMgc3RhdGVtZW50IGluIGNvbW1pdAo+
IGRlc2NyaXB0aW9uLgo+IAo+Pgo+PiBBZGQgYSB3YXRjaGRvZyBkcml2ZXIgZm9yIHRoZSBSSVND
LVYgU0JJIHdhdGNoZG9nIGV4dGVuc2lvbi4KPj4gVGhlIGRyaXZlciBpbnRlZ3JhdGVzIHdpdGgg
dGhlIExpbnV4IHdhdGNoZG9nIGZyYW1ld29yayB0bwo+PiBjb25maWd1cmUgYW5kIGNvbnRyb2wg
dGhlIHdhdGNoZG9nLiBUaGUgZHJpdmVyIGludm9rZXMgdGhlCj4+IFNCSSB3YXRjaGRvZyB1c2lu
ZyB0aGUgc3RhbmRhcmQgU0JJIGNhbGxzLgo+Pgo+PiBTdXBwb3J0IHByZXRpbWVvdXQgZXZlbnQg
bm90aWZpY2F0aW9ucyB1c2luZyBNZXNzYWdlIFNpZ25hbGVkCj4+IEludGVycnVwdHMgKE1TSXMp
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQcmFqd2FsIE4gPHByYWp3YWwubkBvc3MucXVhbGNvbW0u
Y29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICAgICB8ICAxMCAr
Cj4+ICAgZHJpdmVycy93YXRjaGRvZy9NYWtlZmlsZSAgICAgICAgfCAgIDEgKwo+PiAgIGRyaXZl
cnMvd2F0Y2hkb2cvcmlzY3Zfc2JpX3dkdC5jIHwgNDM2ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ0NyBpbnNlcnRpb25zKCspCj4+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvd2F0Y2hkb2cvcmlzY3Zfc2JpX3dkdC5jCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgYi9kcml2ZXJzL3dhdGNoZG9nL0tj
b25maWcKPj4gaW5kZXggZjdkMGEwYzJjMGVmLi5kNmI0ZThjY2QwNTcgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25m
aWcKPj4gQEAgLTIxNjQsNiArMjE2NCwxNiBAQCBjb25maWcgU1RBUkZJVkVfV0FUQ0hET0cKPj4g
ICAgICAgICAgICBTYXkgWSBoZXJlIHRvIHN1cHBvcnQgdGhlIHdhdGNoZG9nIG9mIFN0YXJGaXZl
IEpINzEwMCBhbmQgSkg3MTEwCj4+ICAgICAgICAgICAgU29DLiBUaGlzIGRyaXZlciBjYW4gYWxz
byBiZSBidWlsdCBhcyBhIG1vZHVsZSBpZiBjaG9vc2UgTS4KPj4KPj4gK2NvbmZpZyBSSVNDVl9T
QklfV0FUQ0hET0cKPj4gKyAgICAgICB0cmlzdGF0ZSAiUklTQy1WIFNCSSBiYXNlZCBXYXRjaGRv
ZyBzdXBwb3J0Igo+PiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJCj4+ICsgICAgICAgZGVm
YXVsdCBSSVNDVgo+PiArICAgICAgIHNlbGVjdCBXQVRDSERPR19DT1JFCj4gCj4gRHJvcCAic2Vs
ZWN0IFdBVENIRE9HX0NPUkUiIGluc3RlYWQgZXh0ZW5kICJkZXBlbmRzIG9uIgo+IHRvIGluY2x1
ZGUgV0FUQ0hET0dfQ09SRSAoanVzdCBsaWtlIG90aGVyIHdhdGNoZG9nIGRyaXZlcnMpLgo+IAoK
UGxlYXNlIGV4cGxhaW4gd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgaGVyZS4KTGl0ZXJhbGx5
IGV2ZXJ5IHdhdGNoZG9nIGRyaXZlciB1c2VzICJzZWxlY3QgV0FUQ0hET0dfQ09SRSIuCgo+IFlv
dSB3aWxsIGFsc28gbmVlZCBhIHNlcGFyYXRlIHRoaXJkIHBhdGNoIHRvIGVuYWJsZSBXQVRDSERP
R19DT1JFCj4gaW4gYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZy4KPiAKCldoeSBleGFjdGx5
ID8KCkd1ZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
