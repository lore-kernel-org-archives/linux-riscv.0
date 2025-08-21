Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2107CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHqlbIyshQXzly4Glo/CoaUIEKC2t09HD29AHEU2EUE=; b=KejeKon15q4pow
	qg/zAQLwxI90F1I2C603IJk3kWoEMiS2N13BBYFi5OxKGU0EfvpnquluLDVhgxDlZxSAsjIfAyaOn
	E+XRCMMSd0q1emHgcGCZsqVQ5dQNNx+7pCN0hcGh1lIv6fKezdP6TsOF+Uxl6a+ZQHtldPIQSc0Zw
	zH7UblO3tkGAlflXQcua/MG4p2M72W3Rya8CiJVm7hRBLr/wjdAficIdjuRfE+uBi12YXEs9KIdjX
	Vg/7hhbQbwZ85PUmeIVSIZV6W34CbBL1d0xmefL3ezibMlxpDWQ6FrMgvLfVbJVRRJrxRY4nDCpuo
	/an2roB5pRX6rjw3ZZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Gj-0000000HOqY-3WpQ;
	Thu, 21 Aug 2025 15:32:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4S1-0000000GucM-04pD
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 12:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755779487;
	bh=1X8YBWQ47kcR3NLnc+BPXG4nANE+2JC2KP0lrQKG31k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=pxY2U7T6feWMfT06C+jDFtze1Osu/4/30Jd05L50qRP1+VvZiFq28HhygitP/Ob3X
	 7AgKEzRJm4aK65dep/E37eDo07STb6zGmIi+1+o2wGt4mG3JJF6H6B/GVyz/+s3BIq
	 5HUlOnikVBzFqJn+/fRC+dqu3++s9wG4MPjSjg+tIE7auAevL/3Uxkm2mKAOju655V
	 f7Y854pDGZHftB2+BHbQ73Mb+mKQr2yHyg/sFlDVH2WsrBiY+nBVp7YEXrVOgeJom7
	 M25vTND0UIyH52A1ZGChgPa4YAVPMHoBlP6iVU0/TmnMIzYYlBlt+P7oQ4ziPu4UU+
	 LZZjStQTddfhQ==
Received: from [192.168.100.175] (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4E8D17E0154;
	Thu, 21 Aug 2025 14:31:22 +0200 (CEST)
Message-ID: <4abd97fe-412d-4e3e-9efc-cf3092d66e57@collabora.com>
Date: Thu, 21 Aug 2025 17:31:21 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Albert Ou <aou@eecs.berkeley.edu>,
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, linux-kselftest@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-mm@kvack.org,
 Nico Pache <npache@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-5-usama.anjum@collabora.com>
 <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
 <8e9d7c59-46b4-4e1b-8a55-1898302f5080@collabora.com>
 <88ea592c-c6ff-4a19-a366-eadeca66b039@arm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <88ea592c-c6ff-4a19-a366-eadeca66b039@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_053129_203325_2217248A 
X-CRM114-Status: GOOD (  18.66  )
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

T24gOC8yMS8yNSAzOjQzIFBNLCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+IE9uIDIxLzA4LzIwMjUg
MDg6MjgsIE11aGFtbWFkIFVzYW1hIEFuanVtIHdyb3RlOgo+Pj4gQXMgdG8gLVd1bnVzZWQtcGFy
YW1ldGVyIEkgYW0gZnJhbmtseSBub3QgY29udmluY2VkIGl0J3Mgd29ydGggdGhlCj4+PiBoYXNz
bGUuIFdlJ3JlIGdldHRpbmcgOTAgbGluZXMgY2hhbmdlZCBpbiBwYXRjaCA2LTgganVzdCB0byBt
YXJrCj4+PiBwYXJhbWV0ZXJzIGFzIHVudXNlZCwgaW4gb3RoZXIgd29yZHMgbm9pc2UgdG8ga2Vl
cCB0aGUgY29tcGlsZXIgaGFwcHkuCj4+PiBJdCBpcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IGlu
IHRoZSBrZXJuZWwgcHJvcGVyIHByZWNpc2VseSBiZWNhdXNlIGl0Cj4+PiBpcyBzbyBub2lzeSB3
aGVuIGNhbGxiYWNrcyBhcmUgaW52b2x2ZWQuCj4+Pgo+Pj4gUGF0Y2ggNSBpcyBjbGVhcmx5IGFu
IGltcHJvdmVtZW50LCBidXQgSSdkIHJhdGhlciB0YWtlIGl0IHdpdGhvdXQKPj4+IGFjdHVhbGx5
IGVuYWJsaW5nIC1XdW51c2VkLXBhcmFtZXRlci4gVGhlIHJlc3Qgb2YgdGhpcyBwYXRjaCBpc24n
dCB0aGF0Cj4+PiB1c2VmdWwgZWl0aGVyIElNSE8uCj4+IFBhdGNoIDUgcmVtb3ZlcyBnZW51aW5l
bHkgdW51c2VkIHBhcmFtZXRlcnMgZmxhZ2dlZCBieSB0aGUgY29tcGlsZXIuIElmIHdlCj4+IGRy
b3AgdGhlIC1XdW51c2VkLXBhcmFtZXRlciBvcHRpb24sIGhvd2V2ZXIsIG5ldyB1bnVzZWQgcGFy
YW1ldGVycyB3aWxsCj4+IGNvbnRpbnVlIHRvIGNyZWVwIGluIHdpdGggZnV0dXJlIHBhdGNoZXMu
IFRoZSBnb2FsIG9mIGVuYWJsaW5nIHRoaXMgd2FybmluZwo+PiBpcyB0byBzdXJmYWNlIHN1Y2gg
aXNzdWVzIGVhcmx5IHNvIGRldmVsb3BlcnMgY2FuIGFkZHJlc3MgdGhlbSBkdXJpbmcKPj4gZGV2
ZWxvcG1lbnQsIHJhdGhlciB0aGFuIGxhdGVyIGR1cmluZyByZXZpZXcgb3IgZGVidWdnaW5nLgo+
Pgo+PiBMb25nIHRlcm0sIEnigJlkIGxpa2UgdXMgdG8gcmVseSBtb3JlIG9uIGNvbXBpbGVyIGFu
ZCBzdGF0aWMgYW5hbHlzaXMganVzdCBsaWtlCj4+IGtlcm5lbCB0byBjYXRjaCB0aGVzZSBraW5k
cyBvZiBwcm9ibGVtcyBwcm9hY3RpdmVseSwgaW5zdGVhZCBvZiB3YWl0aW5nIHVudGlsCj4+IHRo
ZXnigJlyZSByZXBvcnRlZCBvciBzb21lb25lIGZpeGVzIHRoZW0gbGF0ZXIuIFdoaWxlIGl0IG1h
eSBmZWVsIGxpa2Ugbm9pc2UKPj4gaW5pdGlhbGx5LCB0aGlzIGlzIGxhcmdlbHkgYSBvbmUtdGlt
ZSBjbGVhbnVw4oCUb25jZSBkb25lLCBkZXZlbG9wZXJzIHdpbGwKPj4gc2ltcGx5IGZpeCB3YXJu
aW5ncyBhcyB0aGV5IGFyaXNlLCBrZWVwaW5nIHRoZSBjb2RlYmFzZSBjbGVhbmVyIGdvaW5nIGZv
cndhcmQuCj4gCj4gQWdyZWVkIG9uIHRoZSBnZW5lcmFsIHByaW5jaXBsZSwgYnV0IEkgdGhpbmsg
dGhlIGhhc3NsZSBpcyBqdXN0IHRvbyBiaWcKPiBmb3Igd2hhdCB3ZSdyZSBnZXR0aW5nIGluIHJl
dHVybiBoZXJlIChzZWUgYWxzbyBBbmRyZXcncyByZXBseSkuIE5ldwo+IGNvZGUgbWF5IGFsc28g
aW50cm9kdWNlIGEgYnVuY2ggb2YgdW51c2VkIHBhcmFtZXRlcnMgZm9yIGxlZ2l0aW1hdGUKPiBy
ZWFzb25zIGFuZCBpdCdzIGVhc3kgdG8gaW1hZ2luZSBjb250cmlidXRvcnMgaWdub3Jpbmcgc3Vj
aCBzZWVtaW5nbHkKPiBoYXJtbGVzcy9pcnJlbGV2YW50IHdhcm5pbmdzIGluc3RlYWQgb2Ygc3By
aW5rbGluZyBfX3VudXNlZCBhbGwgb3Zlci4KCgo+IE15Cj4gZmVlbGluZyBpcyB0aGF0IHVudXNl
ZCBwYXJhbWV0ZXJzIGFyZSBleHBlY3RlZCB0byBiZSBhbGxvd2VkIGluIHRoZQo+IGtlcm5lbCBh
bmQgaXQgaXNuJ3QgaGVscGZ1bCB0byBnbyBhZ2FpbnN0IHRoYXQgZXhwZWN0YXRpb24gaW4ganVz
dCBhCj4gc21hbGwgc3Vic2V0IG9mIGtzZWxmdGVzdHMuCkkgdGhvdWdodCBrZXJuZWwgbXVzdCBi
ZSBnaXZpbmcgZXJyb3IgZm9yIHVudXNlZCBwYXJhbWV0ZXJzIGFzIHdlbGwgKGZyb20KbXkgbWVt
b3J5KS4gQnV0IGp1c3QgY2hlY2tlZCBhbmQgaXQgZG9lc24ndCBzZWVtIGxpa2UgaXQuIEknbSBv
a2F5IHdpdGgKZHJvcHBpbmcgLVd1bnVzZWQtcGFyYW1ldGVycy4KCldlIG5lZWQgdG8gZHJvcCBw
YXRjaCA2LzcgYW5kIGluIFBhdGNoIDQgc2hvdWxkIGhhdmUgb25seToKCi1DRkxBR1MgKz0gLVd1
bnVzZWQgIC1XdW51c2VkLXBhcmFtZXRlciAtV3VudXNlZC1mdW5jdGlvbiAtV3VudXNlZC1sYWJl
bCAtV3VudXNlZC12YXJpYWJsZSAtV3VudXNlZC12YWx1ZQorQ0ZMQUdTICs9IC1XdW51c2VkCgpA
QW5kcmV3LCBTaG91bGQgSSByZXNlbmQgdGhlIGVudGlyZSBzZXJpZXMgb3Igd291bGQgeW91IGNh
biBtYWtlIHRoZSBjaGFuZ2U/Cgo+IAo+IC0gS2V2aW4KCgotLSAKLS0tClRoYW5rcywKVXNhbWEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
