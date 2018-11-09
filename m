Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E95EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232ED20827
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUALxs7T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GZ0DqfI5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="B2B1i+uj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232ED20827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yZVkVkW+BBOHKiYMgv3hd4TW++d90VjyVX4uxWHdoWc=; b=FUALxs7T6ojTALG8+0nh4Hzkl
	dzD+S3jPQnfC1BGPWZyGjdcDq3Xb/Fyl8sJgwvhZYvIf/XQwFsR14fjyyiFIFmctvLjXUFWzrUOuj
	L2y8lARgVY3r04WJtqWNImdpHPhwh4zqx8jSMq5eIbhNuUpHEl6+1At8dVgD5MrO+qvPcLSxHdAjm
	g653e/qQr0R9tC6bSRWF38vMdmLV8S0DDFKhG3BfT9ZqEAgn5msCMXqjyCXQwlJla/lK5y30w6/+Q
	tNnkfplciRF1ZZ4tdXRPJgWHw3iYGL4wH+S5FQruEH3WpLLNk3YOruEeEcI9Jx+QsEoe71bCZ7uhX
	mvanvoIYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLEcg-0006A2-1a; Fri, 09 Nov 2018 21:47:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLEcd-00069P-P7
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 21:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/bE7xh+lPmolHzBTIY42KsdZ2TsLvVHRckhT4PXHL0=; b=GZ0DqfI5IEZ4RSA8L1xJQlGR3+
 0sNSrvbS4yJjQyMXl4Zk9bG1hSZWU0vLBvWVwKHgKa5PdKCVDp5Hv1tq5GFDhZucHSCoeYptqhfua
 XS3uliUpC9hNiWTy5PAaGJ/aI1lKdyXJDE4t/B1SWIE6p8SjoR/dwtMUl53knhcKzy2mPNxNA1gZE
 YG//I/Vf+jlKWZKbURSu71PKqCFMZOUK4bmV9Ctuh3fXY1tN2lFbaLdEf/5UHRYqRJs27hbqu+ry8
 jE6zbU+ZdjVjHFHKhnBTp+WUfEPVYv94GJOVI3VMGAGhBpENL/hnWBZ/M/8iK8wDpfndjMS8BfH5d
 dp9tHsFQ==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLEcY-000570-Vf
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 21:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541800040; x=1573336040;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yo+5QDFEX3E9OIqu5IrfPMGani30ImV56CyQ4g1jvTo=;
 b=B2B1i+ujO+PCM8OvPep31QMZ1diFTbgPk0IrnYoETOuItVwTHHuR6shx
 fg3Bw5L3rLrT58pFNVOXH4iNjI6UzCT+Ee3P6NtqdGtxivEfWJnONwW9x
 XP7j4yrAc/llidX5OhRGBHJ0Cgp8A4S3vuQ78u7tpA/NbUaSGFks+QE4h
 nXz2cS8HkL2IDnNA+Phbmbg7ie3Et0wWUKZGJjNKn7lZIIk3WL4utRvaM
 catjNHEcGsUuN92kS5oE3xDpyh2nQXTLzol/yUZNrn9G7nDS2zyehl6um
 c6LZXh/UPrmFe83+lozquDh0qFHknIwvqIgnZvVLGp8OiCCgkFPT5zYre w==;
X-IronPort-AV: E=Sophos;i="5.54,484,1534780800"; d="scan'208";a="98695277"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2018 05:47:06 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 09 Nov 2018 13:30:38 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Nov 2018 13:47:05 -0800
Subject: Re: SBI extension proposal
To: Zong Li <zongbox@gmail.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <3245c74a8dc9f651cb07e382585fa311@mailhost.ics.forth.gr>
 <5725574a-60c3-26f4-565b-4498c757a8f8@wdc.com>
 <f1d906752a74790f0c3e8ae3530858ad@mailhost.ics.forth.gr>
 <cfc5c651-6d5f-0c29-a96c-e403fe08dda2@wdc.com>
 <f37befdbafe7e52efaf40f4435f55c9f@mailhost.ics.forth.gr>
 <453c1060-b8d8-3be0-d1cb-586f8b62123c@wdc.com>
 <CA+ZOyai01F4pjBHW8LQ_NqsGha=a7XT=+s2qtV2aT5=TF6nnQw@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <886c3e94-1ea8-344b-e64d-5cb0e28e2a06@wdc.com>
Date: Fri, 9 Nov 2018 13:47:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+ZOyai01F4pjBHW8LQ_NqsGha=a7XT=+s2qtV2aT5=TF6nnQw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_214719_670339_5A8B4EE3 
X-CRM114-Status: GOOD (  46.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Zong Li <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "olof.johansson@gmail.com" <olof.johansson@gmail.com>,
 Andrew Waterman <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "rjones@redhat.com" <rjones@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>, Vincent Chen <vincentc@andestech.com>,
 Michael Clark <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 "David.Abdurachmanov@cern.ch" <David.Abdurachmanov@cern.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109214704.0XUVs69Fn6chzGWlU4-TXxO8V0-AVVRI038USMSs3HE@z>

T24gMTEvNS8xOCA1OjU1IFBNLCBab25nIExpIHdyb3RlOgo+IEF0aXNoIFBhdHJhIDxhdGlzaC5w
YXRyYUB3ZGMuY29tPiDmlrwgMjAxOOW5tDEx5pyINuaXpSDpgLHkuowg5LiK5Y2IMjo1MuWvq+mB
k++8mgo+Pgo+PiBPbiAxMS81LzE4IDU6NTEgQU0sIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPj4+
IM6jz4TOuc+CIDIwMTgtMTEtMDMgMDI6MDAsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4+
PiBPbiAxMS8yLzE4IDQ6NDUgUE0sIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPj4+Pj4gzqPPhM65
z4IgMjAxOC0xMS0wMyAwMToxMiwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+Pj4+Pj4gT24g
MTEvMi8xOCA4OjI1IEFNLCBOaWNrIEtvc3NpZmlkaXMgd3JvdGU6Cj4+Pj4+Pj4gSGVsbG8gQXRp
c2ggYW5kIHRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cCwKPj4+Pj4+Pgo+Pj4+Pj4+IM6jz4TO
uc+CIDIwMTgtMTAtMzEgMjA6MjMsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4+Pj4+Pj4g
SGVyZSBpcyBhIHByb3Bvc2FsIHRvIG1ha2UgU0JJIGEgZmxleGlibGUgYW5kIGV4dGVuc2libGUg
aW50ZXJmYWNlLgo+Pj4+Pj4+PiBJdCBpcyBiYXNlZCBvbiB0aGUgZm91bmRhdGlvbiBwb2xpY3kg
b2YgUklTQy1WIGkuZS4gbW9kdWxhcml0eSBhbmQKPj4+Pj4+Pj4gb3Blbm5lc3MuIEl0IGlzIGRl
c2lnbmVkIGluIHN1Y2ggYSB3YXkgdGhhdCBpdCBpbnRyb2R1Y2VzIHZlcnkgZmV3Cj4+Pj4+Pj4+
IG5ldwo+Pj4+Pj4+PiBtYW5kYXRvcnkgU0JJIEFQSXMgdGhhdCBhcmUgYWJzb2x1dGVseSByZXF1
aXJlZCB0byBtYWludGFpbgo+Pj4+Pj4+PiBiYWNrd2FyZAo+Pj4+Pj4+PiBjb21wYXRpYmlsaXR5
LiBFdmVyeXRoaW5nIGVsc2UgaXMgb3B0aW9uYWwgc28gdGhhdCBpdCByZW1haW5zIGFuCj4+Pj4+
Pj4+IG9wZW4KPj4+Pj4+Pj4gc3RhbmRhcmQgeWV0IHJvYnVzdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4g
MS4gSW50cm9kdWN0aW9uOgo+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+IFRoZSBj
dXJyZW50IFJJU0MtViBTQkkgb25seSBkZWZpbmVzIGEgZmV3IG1hbmRhdG9yeSBmdW5jdGlvbnMg
c3VjaAo+Pj4+Pj4+PiBhcwo+Pj4+Pj4+PiBpbnRlci1wcm9jZXNzb3IgaW50ZXJydXB0cyAoSVBJ
KSBpbnRlcmZhY2UsIHJlcHJvZ3JhbW1pbmcgdGltZXIsCj4+Pj4+Pj4+IHNlcmlhbAo+Pj4+Pj4+
PiBjb25zb2xlIGFuZCBtZW1vcnkgYmFycmllciBpbnN0cnVjdGlvbnMuIFRoZSBleGlzdGluZyBT
QkkKPj4+Pj4+Pj4gZG9jdW1lbnRhdGlvbgo+Pj4+Pj4+PiBjYW4gYmUgZm91bmQgaGVyZSBbMV0u
IE1hbnkgaW1wb3J0YW50IGZ1bmN0aW9uYWxpdGllcyBzdWNoIGFzIHBvd2VyCj4+Pj4+Pj4+IG1h
bmFnZW1lbnQvY3B1LWhvdHBsdWcgYXJlIG5vdCB5ZXQgZGVmaW5lZCBkdWUgdG8gZGlmZmljdWx0
aWVzIGluCj4+Pj4+Pj4+IGFjY29tbW9kYXRpbmcgbW9kaWZpY2F0aW9ucyB3aXRob3V0IGJyZWFr
aW5nIHRoZSBiYWNrd2FyZAo+Pj4+Pj4+PiBjb21wYXRpYmlsaXR5Cj4+Pj4+Pj4+IHdpdGggdGhl
IGN1cnJlbnQgaW50ZXJmYWNlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJdHMgZGVzaWduIGlzIGluc3Bp
cmVkIGJ5IFBvd2VyIFN0YXRlIENvb3JkaW5hdGlvbiBJbnRlcmZhY2UgKFBTQ0kpCj4+Pj4+Pj4+
IGZyb20KPj4+Pj4+Pj4gQVJNIHdvcmxkLiBIb3dldmVyLCBpdCBhZGRzIG9ubHkgdHdvIG5ldyBt
YW5kYXRvcnkgU0JJIGNhbGxzCj4+Pj4+Pj4+IHByb3ZpZGluZwo+Pj4+Pj4+PiB2ZXJzaW9uIGlu
Zm9ybWF0aW9uIGFuZCBzdXBwb3J0ZWQgQVBJcywgdW5saWtlIFBTQ0kgd2hlcmUgYQo+Pj4+Pj4+
PiBzaWduaWZpY2FudAo+Pj4+Pj4+PiBudW1iZXIgb2YgZnVuY3Rpb25zIGFyZSBtYW5kYXRvcnku
IFRoZSB2ZXJzaW9uIG9mIHRoZSBleGlzdGluZyBTQkkKPj4+Pj4+Pj4gd2lsbAo+Pj4+Pj4+PiBi
ZSBkZWZpbmVkIGFzIGEgbWluaW11bSB2ZXJzaW9uKDAuMSkgd2hpY2ggd2lsbCBhbHdheXMgYmUg
YmFja3dhcmQKPj4+Pj4+Pj4gY29tcGF0aWJsZS4gU2ltaWxhcmx5LCBhbnkgTGludXgga2VybmVs
IHdpdGggbmV3ZXIgZmVhdHVyZSB3aWxsCj4+Pj4+Pj4+IGZhbGwKPj4+Pj4+Pj4gYmFjayBpZiBh
biBvbGRlciB2ZXJzaW9uIG9mIFNCSSBkb2VzIG5vdCBzdXBwb3J0IHRoZSB1cGRhdGVkCj4+Pj4+
Pj4+IGNhcGFiaWxpdGllcy4gQm90aCB0aGUgb3BlcmF0aW5nIHN5c3RlbSBhbmQgU0VFIGNhbiBi
ZSBpbXBsZW1lbnRlZAo+Pj4+Pj4+PiB0bwo+Pj4+Pj4+PiBiZSB0d28gd2F5IGJhY2t3YXJkIGNv
bXBhdGlibGUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDIuIE5ldyBmdW5jdGlvbnM6Cj4+Pj4+Pj4+IC0t
LS0tLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0tIHUzMiBzYmlfZ2V0X3ZlcnNpb24o
dm9pZCk6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFJldHVybnMgdGhlIGN1cnJlbnQgU0JJIHZlcnNpb24g
aW1wbGVtZW50ZWQgYnkgdGhlIGZpcm13YXJlLgo+Pj4+Pj4+PiB2ZXJzaW9uOiB1aW50MzI6IEJp
dHNbMzE6MTZdIE1ham9yIFZlcnNpb24KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBCaXRzWzE1
OjBdIE1pbm9yIFZlcnNpb24KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlIGV4aXN0aW5nIFNCSSB2ZXJz
aW9uIGNhbiBiZSAwLjEuIFRoZSBwcm9wb3NlZCB2ZXJzaW9uIHdpbGwgYmUKPj4+Pj4+Pj4gYXQK
Pj4+Pj4+Pj4gMC4yCj4+Pj4+Pj4+IEEgZGlmZmVyZW50IG1ham9yIHZlcnNpb24gbWF5IGluZGlj
YXRlIHBvc3NpYmxlIGluY29tcGF0aWJsZQo+Pj4+Pj4+PiBmdW5jdGlvbnMuCj4+Pj4+Pj4+IEEg
ZGlmZmVyZW50IG1pbm9yIHZlcnNpb24gbXVzdCBiZSBjb21wYXRpYmxlIHdpdGggZWFjaCBvdGhl
ciBldmVuCj4+Pj4+Pj4+IGlmCj4+Pj4+Pj4+IHRoZXkgaGF2ZSBhIGhpZ2hlciBudW1iZXIgb2Yg
ZmVhdHVyZXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0tIHUzMiBzYmlfY2hlY2tfYXBpKHVuc2lnbmVk
IGxvbmcgc3RhcnRfYXBpX2lkLCB1bnNpZ25lZCBsb25nCj4+Pj4+Pj4+IGNvdW50KToKPj4+Pj4+
Pj4KPj4+Pj4+Pj4gQWNjZXB0cyBhIHN0YXJ0X2FwaV9pZCBhcyBhbiBhcmd1bWVudCBhbmQgcmV0
dXJucyBpZiBzdGFydF9hcGlfaWQKPj4+Pj4+Pj4gdG8KPj4+Pj4+Pj4gKHN0YXJ0X2FwaV9pZCAr
IGNvdW50IC0gMSkgYXJlIHN1cHBvcnRlZCBvciBub3QuCj4+Pj4+Pj4+IFRoZSBBUEkgbnVtYmVy
aW5nIHNjaGVtZSBpcyBkZXNjcmliZWQgaW4gc2VjdGlvbiAzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBB
IGNvdW50IGlzIGludHJvZHVjZWQgc28gdGhhdCBhIHJhbmdlIG9mIEFQSXMgY2FuIGJlIGNoZWNr
ZWQgYXQgb25lCj4+Pj4+Pj4+IFNCSQo+Pj4+Pj4+PiBjYWxsIHRvIG1pbmltaXplIHRoZSBNLW1v
ZGUgdHJhcHMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBJcyB0aGlzIHJlYWxseSBuZWVkZWQg
PyBXZSBjYW4gZGV0ZXJtaW5lIHRoZSBTQkkgdmVyc2lvbiBmcm9tCj4+Pj4+Pj4gc2JpX2dldF92
ZXJzaW9uLCB3aHkKPj4+Pj4+PiBpbmNsdWRlIGFuIFNCSSBjYWxsIHRvIHBlcmZvcm0gYSBjaGVj
ayB0aGF0IGNhbiBlYXNpbHkgYmUgcGVyZm9ybWVkCj4+Pj4+Pj4gYnkKPj4+Pj4+PiB0aGUgY2Fs
bGVyCj4+Pj4+Pj4gaW5zdGVhZCA/Cj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIEFQSSBpcyBz
dGlsbCBpbiBkaXNjdXNzaW9uLiBQcm9iYWJseSwgYW4gQVBJIHJldHVybmluZyBiaXRtYXNrCj4+
Pj4+PiBvZgo+Pj4+Pj4gYWxsIHRoZSBmZWF0dXJlcyBtYWtlIG1vcmUgc2Vuc2UgPwo+Pj4+Pj4K
Pj4+Pj4+IEhvd2V2ZXIsIEkgZmVlbCBhIHNlcGFyYXRlIEFQSSBpcyByZXF1aXJlZCBmcm9tIHNi
aV9nZXRfdmVyc2lvbiBhcwo+Pj4+Pj4gdGhlcmUgdmVuZG9ycyBjYW4gY2hvb3NlIG5vdCB0byBp
bXBsZW1lbnQgc29tZSBvZiB0aGUgZmVhdHVyZXMgdGhhdAo+Pj4+Pj4gaXMKPj4+Pj4+IHNwZWNp
ZmllZCBieSBhIHZlcnNpb24gYXMgbW9zdCBvZiB0aGUgQVBJIHNldCBhcmUgb3B0aW9uYWwuCj4+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBXZSBjYW4gYWx3YXlzIHJlbHkgb24gdGhlIFNCSV9OT1RfU1VQUE9S
VEVEIGVycm9yIGNvZGUgeW91J3ZlIGFscmVhZHkKPj4+Pj4gaW5jbHVkZWQgOy0pCj4+Pj4KPj4+
Pgo+Pj4+IFRoYXQncyB3aGF0IHNiaV9jaGVja19hcGkgd2lsbCByZXR1cm4gaWYgYSBzaW5nbGUg
QVBJIG9yIHNldCBvZiBBUEkgaXMKPj4+PiBub3Qgc3VwcG9ydGVkLiBXZSBwb3RlbnRpYWxseSBj
YW4gcmV0dXJuIGl0IGZyb20gaW5kaXZpZHVhbCBmdW5jdGlvbgo+Pj4+IGNhbGxzIGJ1dCBoYXZp
bmcgYSBzZXBhcmF0ZSBBUEkgaGVscHMgaW4gYXZvaWRpbmcgbWFraW5nIHRob3NlIGNhbGxzCj4+
Pj4gaW4gZmlyc3QgcGxhY2UgZnJvbSBzdXBlcnZpc29yIGxldmVsLgo+Pj4+Cj4+Pj4gSWYgd2Ug
dXNlIGEgYml0bWFzayBmb3IgY2FwYWJpbGl0aWVzIHdlJ2xsIGJlIGxpbWl0ZWQgYnkKPj4+Pj4g
dGhlIGVuY29kaW5nLgo+Pj4+Pgo+Pj4+IFRoYXQgd2FzIHRoZSByZWFzb24gc2JpX2NoZWNrX2Fw
aSB3YXMgaW50cm9kdWNlZC4gQnV0IGxvb2tpbmcgYmFjaywgSQo+Pj4+IHdvbmRlciBpZiB3ZSBl
dmVyIGhhdmUgbW9yZSB0aGFuIDI0IFNCSSBBUElzIHRvIGRlYWwgd2l0aCEhCj4+Pj4KPj4+Pgo+
Pj4+Pj4+PiAtLSBpbnQgc2JpX2hhcnRfdXAodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVuc2lnbmVk
IGxvbmcgc3RhcnQsCj4+Pj4+Pj4+IHVuc2lnbmVkCj4+Pj4+Pj4+IGxvbmcgcHJpdikKPj4+Pj4+
Pj4KPj4+Pj4+Pj4gQnJpbmdzIHVwICJoYXJ0aWQiIGVpdGhlciBkdXJpbmcgaW5pdGlhbCBib290
IG9yIGFmdGVyIGEKPj4+Pj4+Pj4gc2JpX2hhcnRfZG93bgo+Pj4+Pj4+PiBTQkkgY2FsbC4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gInN0YXJ0IiBwb2ludHMgdG8gYSBydW50aW1lLXNwZWNpZmllZCBhZGRy
ZXNzIHdoZXJlIGEgaGFydCBjYW4KPj4+Pj4+Pj4gZW50ZXIKPj4+Pj4+Pj4gaW50byBzdXBlcnZp
c29yIG1vZGUuIFRoaXMgbXVzdCBiZSBhIHBoeXNpY2FsIGFkZHJlc3MuCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+ICJwcml2IiBpcyBhIHByaXZhdGUgZGF0YSB0aGF0IGNhbGxlciBjYW4gdXNlIHRvIHBhc3Mg
aW5mb3JtYXRpb24KPj4+Pj4+Pj4gYWJvdXQKPj4+Pj4+Pj4gZXhlY3V0aW9uIGNvbnRleHQuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IFJldHVybiB0aGUgYXBwcm9wcmlhdGUgU0JJIGVycm9yIGNvZGUuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IC0tIGludCBzYmlfaGFydF9zdXNwZW5kKHUzMiBzdGF0ZSwgdW5zaWdu
ZWQgbG9uZyByZXN1bWVfZW50cnksCj4+Pj4+Pj4+IHVuc2lnbmVkCj4+Pj4+Pj4+IGxvbmcgcHJp
dikKPj4+Pj4+Pj4KPj4+Pj4+Pj4gU3VzcGVuZHMgdGhlIGNhbGxpbmcgaGFydCB0byBhIHBhcnRp
Y3VsYXIgcG93ZXIgc3RhdGUuIFN1c3BlbmRlZAo+Pj4+Pj4+PiBoYXJ0Cj4+Pj4+Pj4+IHdpbGwg
YXV0b21hdGljYWxseSB3YWtlLXVwIGJhc2VkIG9uIHNvbWUgd2FrZXVwIGV2ZW50cyBhdAo+Pj4+
Pj4+PiByZXN1bWVfZW50cnkKPj4+Pj4+Pj4gcGh5c2ljYWwgYWRkcmVzcy4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gInByaXYiIGlzIGEgcHJpdmF0ZSBkYXRhIHRoYXQgY2FsbGVyIGNhbiB1c2UgdG8gcGFz
cyBpbmZvcm1hdGlvbgo+Pj4+Pj4+PiBhYm91dAo+Pj4+Pj4+PiBleGVjdXRpb24gY29udGV4dC4g
VGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBtdXN0IHNhdmUgYSBjb3B5IHNvIHRoYXQKPj4+Pj4+Pj4g
Y2FsbGVyIGNhbiByZXVzZSB3aGlsZSByZXN0b3JpbmcgaGFydCBmcm9tIHN1c3BlbmQuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IFJldHVybiB0aGUgYXBwcm9wcmlhdGUgU0JJIGVycm9yIGNvZGUuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IC0tIGludCBzYmlfaGFydF9kb3duKCkKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSXQg
cG93ZXJzIG9mZiB0aGUgaGFydCBhbmQgd2lsbCBiZSB1c2VkIGluIGNwdS1ob3RwbHVnLgo+Pj4+
Pj4+PiBPbmx5IGluZGl2aWR1YWwgaGFydCBjYW4gcmVtb3ZlIGl0c2VsZiBmcm9tIHN1cGVydmlz
b3IgbW9kZS4gSXQgY2FuCj4+Pj4+Pj4+IGJlCj4+Pj4+Pj4+IG1vdmVkIHRvIG5vcm1hbCBzdGF0
ZSBvbmx5IGJ5IHNiaV9oYXJ0X3VwIGZ1bmN0aW9uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBSZXR1cm4g
dGhlIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtLSB1MzIg
c2JpX2hhcnRfc3RhdGUodW5zaWduZWQgbG9uZyBoYXJ0aWQpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFJl
dHVybnMgdGhlIFJJU0NWX1BPV0VSX1NUQVRFIGZvciBhIHNwZWNpZmljIGhhcnRpZC4gVGhpcyB3
aWxsIGhlbHAKPj4+Pj4+Pj4gbWFrZQo+Pj4+Pj4+PiBrZXhlYyBsaWtlIGZ1bmN0aW9uYWxpdHkg
bW9yZSByb2J1c3QuCj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBJbnN0ZWFkIG9mIHRoZSBhYm92
ZSBJIGJlbGlldmUgaXQgd291bGQgYmUgY2xlYW5lciBhbmQgc2ltcGxlciB0bwo+Pj4+Pj4+IGhh
dmUKPj4+Pj4+PiBhbiBzYmlfZ2V0X2hhcnRfc3RhdGUgYW5kIGFuIHNiaV9zZXRfaGFydF9zdGF0
ZSBjYWxsLiBUaGlzIHdheSB3ZQo+Pj4+Pj4+IGNhbgo+Pj4+Pj4+IGJldHRlciBoYW5kbGUgc3Rh
dGUgdHJhbnNpdGlvbnMgYW5kLCBoYW5kbGUgT04vT0ZGL1NUQU5EQlkvUkVURU5USU9OCj4+Pj4+
Pj4gYW5kIGFueSBvdGhlciBzdGF0ZSB3ZSBjb21lIHVwIHdpdGgsIHdpdGhvdXQgYWRkaW5nIGV4
dHJhIHNiaSBjYWxscy4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdoZW4gZG8geW91IHdhbnQgdG8g
dXNlIHNiaV9zZXRfaGFydF9zdGF0ZSA/Cj4+Pj4+PiBUaGUgcG93ZXIgc3RhdGVzIHdpbGwgYmUg
bW9kaWZpZWQgYXMgYSBwYXJ0IG9mIHNiaV9oYXJ0X2Rvd24gb3IKPj4+Pj4+IHNiaV9zaHV0ZG93
bi9zdXNwZW5kIGNhbGxzIGFueXdheXMuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGUgaWRlYSBpcyB0
byBoYXZlIHNiaV9zZXRfaGFydF9zdGF0ZSBpbnN0ZWFkIG9mCj4+Pj4+IHNiaV9oYXJ0X2Rvd24v
c2h1dGRvd24vc3VzcGVuZC9ldGMuCj4+Pj4+IEluc3RlYWQgb2YgaGF2aW5nIGRpZmZlcmVudCBj
YWxscyBmb3IgZGlmZmVyZW50IHN0YXRlcyB3ZSBqdXN0IGhhdmUKPj4+Pj4gdHdvCj4+Pj4+IGNh
bGxzLCBvbmUKPj4+Pj4gdG8gZ2V0IHRoZSBzdGF0ZSBhbmQgb25lIHRvIHNldCBpdC4gVGhpcyB3
YXkgd2UgaGF2ZSBmZXdlciBjYWxscyBhbmQKPj4+Pj4gaWYKPj4+Pj4gd2UgYWRkIGEKPj4+Pj4g
bmV3IHN0YXRlIHdlIGNhbiBhZGQgaXQgd2l0aG91dCBoYXZpbmcgdG8gYWRkIGEgbmV3IGNhbGwu
Cj4+Pj4+Cj4+Pj4gQWhoIEkgc2VlIGl0IG5vdy4gSU1ITywgaGF2aW5nIGV4cGxpY2l0IG5hbWVz
IG1ha2VzIG1vcmUgc2Vuc2UuCj4+Pj4KPj4+Pgo+Pj4+Pj4+PiAtLSB2b2lkIHNiaV9zeXN0ZW1f
c2h1dGRvd24oKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBQb3dlcnMgb2ZmIHRoZSBlbnRpcmUgc3lzdGVt
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gRG9uJ3Qgd2UgYWxyZWFkeSBoYXZlIHRoYXQgPyBX
aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2Vlbgo+Pj4+Pj4+IHNiaV9zeXN0ZW1fc2h1dGRvd24K
Pj4+Pj4+PiBhbmQgc2JpX3NodXRkb3duID8gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIHVzZSBzYmlf
c2h1dGRvd24gYW5kIGxlYXZlCj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4gc3lzdGVtCj4+Pj4+Pj4gb24g
d2l0aCBhbGwgdGhlIGhhcnRzIGRvd24gPyBNYXliZSB3ZSBjYW4ganVzdCBzYXkgdGhhdCBzYmlf
c2h1dGRvd24KPj4+Pj4+PiBhbHNvCj4+Pj4+Pj4gcG93ZXJzIGRvd24gdGhlIHN5c3RlbSBhbmQg
cmVuYW1lIGl0IHRvIHNiaV9zeXN0ZW1fc2h1dGRvd24gd2l0aCB0aGUKPj4+Pj4+PiBzYW1lCj4+
Pj4+Pj4gZnVuY3Rpb24gSUQuCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBZZWFoLiBUaGF0J3MgYSBi
ZXR0ZXIuCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pj4gMy4gU0JJIEFQSSBJRCBudW1iZXJpbmcgc2No
ZW1lOgo+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4gQW4g
QVBJIFNldCBpcyBhIHNldCBvZiBTQkkgQVBJcyB3aGljaCBjb2xsZWN0aXZlbHkgaW1wbGVtZW50
IHNvbWUKPj4+Pj4+Pj4ga2luZCBvZiBmZWF0dXJlL2Z1bmN0aW9uYWxpdHkuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IExldCdzIHNheSBTQkkgQVBJIElEIGlzIHUzMiAgdGhlbgo+Pj4+Pj4+PiBCaXRbMzE6
MjRdID0gIEFQSSBTZXQgTnVtYmVyCj4+Pj4+Pj4+IEJpdFsyMzowXSA9IEFQSSBOdW1iZXIgd2l0
aGluIEFQSSBTZXQKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSGVyZSBhcmUgZmV3IEFQSSBTZXRzIGZvciBT
QkkgdjAuMjoKPj4+Pj4+Pj4gMS4gQmFzZSBBUElzCj4+Pj4+Pj4+IEFQSSBTZXQgTnVtYmVyOiAw
eDAKPj4+Pj4+Pj4gRGVzY3JpcHRpb246IEJhc2UgQVBJcyBtYW5kYXRvcnkgZm9yIGFueSBTQkkg
dmVyc2lvbgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAyLiBIQVJUIFBNIEFQSXMKPj4+Pj4+Pj4gQVBJIFNl
dCBOdW1iZXI6IDB4MQo+Pj4+Pj4+PiBEZXNjcmlwdGlvbjogSGFydCBVUC9Eb3duL1N1c3BlbmQg
QVBJcyBmb3IgcGVyLUhhcnQKPj4+Pj4+Pj4gcG93ZXIgbWFuYWdlbWVudAo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiAzLiBTeXN0ZW0gUE0gQVBJcwo+Pj4+Pj4+PiBBUEkgU2V0IE51bWJlcjsgMHgyCj4+Pj4+
Pj4+IERlc2NyaXB0aW9uOiBTeXN0ZW0gU2h1dGRvd24vUmVib290L1N1c3BlbmQgZm9yIHN5c3Rl
bS1sZXZlbAo+Pj4+Pj4+PiBwb3dlciBtYW5hZ2VtZW50Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDQuIFZl
bmRvciBBUElzCj4+Pj4+Pj4+IEFQSSBTZXQgTnVtYmVyOiAweGZmCj4+Pj4+Pj4+IERlc2NyaXB0
aW9uOiBWZW5kb3Igc3BlY2lmaWMgQVBJcy4KPj4+Pj4+Pj4gVGhlcmUgaXMgYSBwb3NzaWJpbGl0
eSB0aGF0IGRpZmZlcmVudCB2ZW5kb3JzIGNhbiBjaG9vc2UgdG8gYXNzaWduCj4+Pj4+Pj4+IHNh
bWUgQVBJIG51bWJlcnMgZm9yIGRpZmZlcmVudCBmdW5jdGlvbmFsaXR5LiBJbiB0aGF0IGNhc2Us
IHZlbmRvcgo+Pj4+Pj4+PiBzcGVjaWZpYyBzdHJpbmdzIGluIERldmljZSBUcmVlIGNhbiBiZSB1
c2VkIHRvIHZlcmlmeSBpZiBhIHNwZWNpZmljCj4+Pj4+Pj4+IEFQSSBiZWxvbmdzIHRvIHRoZSBp
bnRlbmRlZCB2ZW5kb3Igb3Igbm90Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB1bmRlcnN0
YW5kIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoaXMgYnV0IEkgYmVsaWV2ZSBpdCdzIGJldHRlciB0
bwo+Pj4+Pj4+IGNhbGwgdGhlbSBzZXJ2aWNlcyBvciBmdW5jdGlvbnMgaW5zdGVhZCBvZiBBUElz
LCB0aGV5IGFyZSBub3Qgc2V0cwo+Pj4+Pj4+IG9mIEFQSXMgdGhlIHdheSBJIHNlZSBpdC4gQWxz
byBzaW5jZSB3ZSBhcmUgbW92aW5nIHRoYXQgcGF0aCB3aHkKPj4+Pj4+PiBjYWxsCj4+Pj4+Pj4g
aXQgU0JJIGFuZCByZXN0cmljdCBpdCBvbmx5IHRvIGJlIHVzZWQgYnkgdGhlIHN1cGVydmlzb3Ig
PyBJJ2QgbG92ZQo+Pj4+Pj4+IHRvCj4+Pj4+Pj4gaGF2ZSBhbm90aGVyIGNhdGVnb3J5IGZvciB0
aGUgc2VjdXJlIG1vbml0b3IgY2FsbHMgZm9yIGV4YW1wbGUsCj4+Pj4+Pj4gYnV0IG9uIHRoZSBz
b2Z0d2FyZSBhcmNoaXRlY3R1cmUgdGhhdCB3ZSBhcmUgZGlzY3Vzc2luZyBvbiB0aGUgVEVFCj4+
Pj4+Pj4gZ3JvdXAsIHN1Y2ggY2FsbHMgY2FuIGFsc28gb3JpZ2luYXRlIGZyb20gVSBtb2RlIG9y
IEhTL0hVIG1vZGVzLgo+Pj4+Pj4+IFRoZSBzYW1lIGdvZXMgZm9yIHZlbmRvciBzcGVjaWZpYyBj
YWxscywgdGhlcmUgYXJlIGxvdHMgb2YgdXNlIGNhc2UKPj4+Pj4+PiBzY2VuYXJpb3Mgd2hlcmUg
dmVuZG9ycyB3b3VsZCBsaWtlIHRvIGJlIGFibGUgdG8gY2FsbCB0aGVpciBzdHVmZgo+Pj4+Pj4+
IGZyb20gVSBtb2RlIGZvciBleGFtcGxlIChlLmcuIGEgdXNlciBzcGFjZSBsaWJyYXJ5IHRhbGtp
bmcgdG8gYQo+Pj4+Pj4+IHNtYXJ0IGNhcmQgZGlyZWN0bHkpLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBz
dWdnZXN0IHdlIHJlbmFtZSBpdCBmcm9tIFNCSSB0byBzb21ldGhpbmcgbW9yZSBnZW5lcmljIHRo
YXQgaXMKPj4+Pj4+PiBub3QKPj4+Pj4+PiBkZWZpbmVkIGJ5IHdobyBpcyBjYWxsaW5nIGl0IGJ1
dCBieSB3aGF0IHdlIGFyZSBjYWxsaW5nLCB3aGljaCBpbgo+Pj4+Pj4+IHRoaXMKPj4+Pj4+PiBj
YXNlIGlzIHRoZSBmaXJtd2FyZSAoRkJJPykuCj4+Pj4+Pgo+Pj4+Pj4gcG9zc2libGUgY29uZmxp
Y3Qgd2l0aCBhIHZlcnkgZmFtb3VzIGxhdyBlbmZvcmNlbWVudCBhZ2VuY3kgOikgOikuCj4+Pj4+
Pgo+Pj4+Pj4gSm9rZXMgYXNpZGUsIHJlbmFtaW5nIHRvIHNvbWV0aGluZyBtb3JlIGdlbmVyaWMg
aXMgYSBnb29kIGlkZWEuIEJ1dAo+Pj4+Pj4gaXQKPj4+Pj4+IHdpbGwgcHJvYmFibHkgYnJlYWsg
YSB0b24gb2YgZG9jdW1lbnRhdGlvbi9zcGVjIGluIFJJU0MtViB3aGljaCBJCj4+Pj4+PiBkb24n
dCB3YW50IHRvIGRlYWwgd2l0aCByaWdodCBub3cuIE1heSBiZSBpbiBmdXR1cmUgdmVyc2lvbnMg
Pwo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gSSBnZXQgdGhhdCB1cGRhdGluZyB0aGUgZG9jdW1lbnRhdGlv
biBjYW4gYmUgYSBwYWluLCBJIGNhbiBoZWxwIHdpdGgKPj4+Pj4gdGhhdCBpZiB5b3Ugd2FudCAo
YW5kIEkgcHJvbWlzZSBJJ2xsIHN0YXkgYXdheSBmcm9tIGxhdyBlbmZvcmNlbWVudAo+Pj4+PiBh
Z2VuY2llcyAhKS4gSSBzdWdnZXN0IHdlIGRvIHRoZSByZW5hbWluZyBhcyBlYXJseSBhcyBwb3Nz
aWJsZQo+Pj4+PiBiZWNhdXNlIHdlIGFyZSBnb2luZyB0byBjYXJyeSBpdCBmb3IgYSBsb25nIHRp
bWUgaW5zdGVhZCBhbmQgaXQnbGwKPj4+Pj4gb25seSBnZXQgaGFyZGVyIHRvIGNoYW5nZSBsYXRl
ciBvbi4KPj4+Pj4KPj4+PiBUaGFua3MuIEkgZ3Vlc3Mgd2UgbmVlZCBQYWxtZXIvQW5kcmV3IHRv
IHBpdGNoIGluIGZpcnN0IG9uIHRoaXMgYmVmb3JlCj4+Pj4gd2UgZGVjaWRlIGFueXRoaW5nLgo+
Pj4+Cj4+Pgo+Pj4gSSBqdXN0IG5vdGljZWQgdGhhdCBvbiBwcml2aWxlZ2Ugc3BlYywgU0JJIHN0
YW5kcyBmb3IgU3lzdGVtIEJpbmFyeQo+Pj4gSW50ZXJmYWNlLAo+Pj4gbm90IFN1cGVydmlzb3Ig
QmluYXJ5IEludGVyZmFjZSBhcyBtZW50aW9uZWQgaGVyZToKPj4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1zYmktZG9jL2Jsb2IvbWFzdGVyL3Jpc2N2LXNiaS5tZAo+Pj4KPj4+ICJT
eXN0ZW0iIGlzIGJyb2FkZXIgdGhhbiAic3VwZXJ2aXNvciIgc2luY2UgaXQgZG9lc24ndCBpbXBs
eSB0aGUgbW9kZQo+Pj4gd2hlcmUKPj4+IHRoZSBjYWxscyBvcmlnaW5hdGUgZnJvbS4gT24gdGhl
IG90aGVyIGhhbmQgaXQgZG9lc24ndCBzYXkgYW55dGhpbmcKPj4+IGFib3V0Cj4+PiB3aG8gaXMg
Y2FsbGluZyBvciB3aG8gaXQgY2FsbHMsIGl0J3MgdmVyeSBicm9hZCwgaXQgY2FuIGJlIGFuIGlu
dGVyZmFjZQo+Pj4gYmV0d2VlbiBhbnl0aGluZy4KPj4+Cj4+IEkgZ3Vlc3MgeW91IGZvdW5kIGEg
dHlwbyBpbiBwcml2aWxlZ2VkIHNwZWMuCj4+Cj4+IEl0IGlzIG1lbnRpb25lZCBhcyBzdXBlcnZp
c29yIGJpbmFyeSBpbnRlcmZhY2UgKFNCSSkgaW4gY2hhcHRlciAxCj4+IChodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9ibG9iL21hc3Rlci9zcmMvaW50cm8udGV4I0wx
MjYpCj4+IHdoaWxlIHN5c3RlbSBiaW5hcnkgaW50ZXJmYWNlIChTQkkpIGluIENoYXB0ZXIgNC4K
Pj4gKGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2Jsb2IvbWFzdGVy
L3NyYy9zdXBlcnZpc29yLnRleCNMOSkKPj4KPj4gSSBoYXZlIGZpbGVkIGEgYnVnIGluIGdpdGh1
YiBmb3Igbm93Lgo+Pgo+IAo+IFdoaWNoIEFQSSBzZXQgaXMgc3VpdGFibGUgZm9yIHRyaWdnZXIg
bW9kdWxlIHVzZT8gV2UgbmVlZCB0byBpbnZva2UgYQo+IFNCSSBjYWxsIHRvIHNldCB0cmlnZ2Vy
IG1vZHVsZS4gV2UgY2FuIHVzZSBvbmUgU0JJIGNhbGwgZm9yIHNldHRpbmcKPiBtY29udHJvbCwg
aWNvdW50LCBpdHJpZ2dlciBhbmQgZXRyaWdnZXIoZGVjaWRlIHdoaWNoIHR5cGVzIGluc2lkZSB0
aGlzCj4gU0JJKSwgb3IgZm91ciBTQkkgY2FsbHMgZm9yIHRoZW0gcmVzcGVjdGl2ZWx5LiAKCkkg
ZG9uJ3QgaGF2ZSB0b28gbXVjaCBpbnNpZ2h0IGludG8gaG93IHRyaWdnZXIgbW9kdWxlIHdvcmtz
IG9yIGhvdyBkbyAKeW91IHN3aXRjaCB0byBkZWJ1ZyBtb2RlIGZyb20gUyBtb2RlLiBIb3dldmVy
LCBpZiB5b3UgYWJzb2x1dGVseSBuZWVkIApTQkkgY2FsbHMsIG9uZSBzaW5nbGUgY2FsbCB3aXRo
IGFuIGFyZ3VtZW50IHdvdWxkIGJlIHRoZSBiZXN0IGNob2ljZS4KCk9uIHRoZSBvdGhlciBoYW5k
LCBJCj4gc2F3IHRoZSBwZXJmIGJyYW5jaCBpbiByaXNjdi1wayByZXBvc2l0b3J5LCBtYXliZSB3
ZSBzaG91bGQgY29uc2lkZXIKPiBpdCB0b2dldGhlcj8gQnV0IGFjdHVhbGx5LCB0byBiZSBleGFj
dCwgb25lIGlzIGRlYnVnZ2luZyB1c2UsIGFuZAo+IGFub3RoZXIgb25lIGlzIHRyYWNpbmcgdXNl
Lgo+IApJIGFtIG5vdCBzdXJlIHdoeSBkbyB3ZSBuZWVkIFNCSSBjYWxscyBmb3IgcGVyZi4gSVNB
IHNwZWMgYWxyZWFkeSBoYXZlIApwcm92aXNpb25zIGZvciB2ZW5kb3Igc3BlY2lmaWMgcGVyZiBj
b3VudGVycyB2aWEgaHBtY291bnRlcm4gd2hpY2ggeW91IApjYW4gYWNjZXNzIGluIHN1cGVydmlz
b3IgbW9kZSBqdXN0IGxpa2UgY3ljbGUgJiBpbnN0cmV0LgoKClJlZ2FyZHMsCkF0aXNoCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
