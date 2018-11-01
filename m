Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6F4C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 831B2205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dneA0F9p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 831B2205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2M9TQF5Ui+toD7OSULUHn+Sq4upFXZ2RMBQok4XDs5E=; b=dneA0F9pzs7h6a
	1oeNB+WEY8rbKWnYokWt8ndIB33fUL10xSVMV/f+U1hf77Qv93ycZvZwvLXo/TH6vOH2Icu5CXnP3
	ptXmCYRckx+/rvN9MnunmifX1H+R97NSg77A9dnz81+sLRI7PQ+R9l7KtriN7yW7efIrCe5dMf0eC
	MjunB/ZVnEdMsoaKFkRPfve+zoO6l/vR4J09ixOJVAzYquoYsJXGW19hT+ysGJ00JJxlZJIUimRSc
	ykhf4Q3HiXEo2jI7SwpQ1g7LQWAxtIB7Q/3FXwnlsUar1rTrR4Qb4TsuL6v4r9jfPVWRYIIcvKF68
	hIhKzRYgw0v0q1qL2J5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIG3z-0007LQ-Sa; Thu, 01 Nov 2018 16:43:19 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIG3P-0006gi-AO
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 16:42:45 +0000
Received: from excalibur.cnev.de ([213.196.202.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mgvj3-1fdQaa3mWr-00hK8s; Thu, 01 Nov 2018 17:42:10 +0100
Received: from excalibur.cnev.de ([213.196.202.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mgvj3-1fdQaa3mWr-00hK8s; Thu, 01 Nov 2018 17:42:10 +0100
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1gIG2n-0005uX-H6; Thu, 01 Nov 2018 17:42:05 +0100
Date: Thu, 1 Nov 2018 17:42:05 +0100
From: Karsten Merker <merker@debian.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: SBI extension proposal
Message-ID: <20181101164205.l2bra3a6kihjpuib@excalibur.cnev.de>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181101094609.GE27120@redhat.com>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:5A5ji4PWijz3kTKNS1AXvjlZR0gPTcrv1pyrbNuykRzMl1LcUAX
 Z6s8X7h+S82V3ZE8XM/Db3y9dYrmm1WGNJ3z1Ye9PSR0InqsgrcQM5D9OMOxY8l+HBjNxzj
 mWiuq3UHAqgwFp3KoNafaiVp+lBXB/QCg0UO9uhLH9CPj/QK5FcOTp0YureGZYbvUSuZ3yg
 XY4Yehj5EwFPWMudc6gPw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:5swXlMBXd8Q=:HTYUbkiYCSuudhZO5R34Vo
 q7Y0t79wuj7KGEW6GzpkzOSkQ8Mguv385E8jL449cm5U3OhZDISf1zXDY9AjjaioaR+85Mnxn
 y2hKK0yb97XEJv3b9prB3V4KZl91BTdLnJav1w0MZ/Xg/WK+fvcNQXar0/887zzxgzvKMrlXb
 zeEtazEX5/I0XTgTkvSJ9ksdg3JHINRVdQeh1zo2jBtZo/R59vmPyGtNctyurN58H9BQXna5o
 h1rjT/dS2O7j6hkaGmHdncqiJMxLBWKpGTL7MNrELKRXfbMFIMUFpyC2DGuHtyRLhqdxpg0jl
 9B909rngDk+ArOvEsPqhNVPGcIF+Vk+grzVu56E1Ro2GsX1VvtJiq5JmigHrdeffIEK9jkV/m
 62aog5q88iL6rU+VegvJiTKV7cyAv/uHgbbHIroAPnEUWggf9f4LeZUk4muxsjdE4txT7iE5S
 1Rm69GMnXrzj10JdWfTxtiVUce5OR4Yz3pwOT8AoGv/TJGcOEmpO9P7KFkQCh0eGh9kE1sDgw
 DCG2GZxft+4rDslrWtZWs3BRTdX5o9IPrzDN5CbifyXn12ByB56GAQS92VnxtSscbeeJaSckz
 V7GP10KKP/BYObUzdHu3XmhvCJPeDQXAYUolIQyZD7HIuyGRAF/+k3m7CcXCEz98MWdk6DhPS
 2ycInvbLihfAGdPSsto9rs6uZTvUynLyogj7QRbbuCBSzuVB8S1c4cInptrPomPDI2IU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_094243_833556_F9268855 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Zong Li <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, olof.johansson@gmail.com,
 Andrew Waterman <andrew@sifive.com>, alankao@andestech.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Michael Clark <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 paul.walmsley@sifive.com, philipp@hug.cx, linux-riscv@lists.infradead.org,
 abner.chang@hpe.com, vincentc@andestech.com, David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMDk6NDY6MDlBTSArMDAwMCwgUmljaGFyZCBXLk0uIEpv
bmVzIHdyb3RlOgo+IE9uIFRodSwgTm92IDAxLCAyMDE4IGF0IDAzOjA1OjUxUE0gKzA1MzAsIEFu
dXAgUGF0ZWwgd3JvdGU6ClsuLi5dCj4gPiA+IEhvdyBhYm91dCBwdXR0aW5nIHRoZSB2ZXJzaW9u
IGluZm9ybWF0aW9uIGludG8gZGV2aWNlIHRyZWUKPiA+ID4gYW5kIHVzZSB0aGUgY29tcGF0aWJs
ZSBzdHJpbmc/ICBUaGlzIHNlZW1zIG1vcmUgcmVsaWFibGUKPiA+ID4gdGhhbiBwcm9iaW5nLgo+
ID4gPiBlLmcuCj4gPiA+IGZpcm13YXJlIHsKPiA+ID4gICAgICAgICBzYmkgewo+ID4gPiAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNjdixzYmktcjBwMSIsICJyaXNjdixzYmktcjBw
MiI7Cj4gPiA+ICAgICAgICAgfTsKPiA+ID4gfTsKPiA+IAo+ID4gSWYgaXQgd2FzIGp1c3QgRFQg
dGhlbiBJIHRoaW5rIGhhdmluZyB0aGlzIGluZm9ybWF0aW9uIGluIERUIG1ha2VzCj4gPiBzZW5z
ZS4gSW4gZnV0dXJlLAo+ID4gd2UgbWlnaHQgZGVmaW5pdGVseSBzZWUgc29tZSBBQ1BJIHN1cHBv
cnQgaW4gUklTQy1WIHRvbyAoanVzdCBsaWtlIEFSTTY0IHdvcmxkKS4KPiAKPiBJIGFncmVlLiAg
UGxlYXNlIHRyeSBub3QgdG8gbWFrZSB0aGluZ3MgdGhhdCBkZXBlbmQgb24gRFQsIGFzIGl0J3Mg
YQo+IExpbnV4LW9ubHkgZGVzY3JpcHRpb24gd2hpY2ggaXNuJ3Qgc3VpdGFibGUgZm9yIG90aGVy
IE9TZXMgYW5kIGhhcyBhCj4gcG9vcmx5IGRlZmluZWQgQUJJLgoKSGVsbG8sCgp0aGUgbm90aW9u
IHRoYXQgRFQgaXMgYSAiTGludXgtb25seSIgZGVzY3JpcHRpb24gYW5kIG5vdCBzdWl0YWJsZQpm
b3Igb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMgaXNuJ3QgY29ycmVjdC4gIEJlc2lkZXMgYmVpbmcg
dXNlZCBieQpMaW51eCwgZGV2aWNlLXRyZWUgaXMgYWxzbyB1c2VkIGJ5IGF0IGxlYXN0IFUtQm9v
dCwgRnJlZUJTRCBhbmQKTmV0QlNELiAgQmFzZWQgb24gaXNzdWVzIGluIHRoZSBlYXJseSBkYXlz
IG9mIERUIG9uZSBjYW4gc3VyZWx5CmRpc2N1c3MgYWJvdXQgZGV2aWNlLXRyZWUgQUJJIHN0YWJp
bGl0eSwgYnV0IHNpbmNlIHRoZW4gYSBsb3Qgb2YKZWZmb3J0IGhhcyBiZWVuIHB1dCBpbnRvIG1h
a2luZyBEVCBBQkktc3RhYmxlLCBhbmQgaW4gbXkKZXhwZXJpZW5jZSB0aGlzIGVmZm9ydCBoYXMg
YmVlbiBzdWNjZXNzZnVsLiAgT24gdGhlIG90aGVyIGhhbmQgSQpoYXZlIGV4cGVyaWVuY2VkIHdh
eSBtb3JlIEFDUEkgaXNzdWVzIG9uIHg4Ni02NCBoYXJkd2FyZSB0aGFuIEkKd291bGQgbGlrZSB0
byByZW1lbWJlciwgc28gSSB0ZW5kIHRvIGFzc3VtZSB0aGF0IGluIHRoZSBBQ1BJCndvcmxkIGFs
c28gbm90IGV2ZXJ5dGhpbmcgaXMgbmljZSBhbmQgc2hpbmluZy4KClJlZ2FyZHMsCkthcnN0ZW4K
LS0gCkdlbS4gUGFyLiAyOCBBYnMuIDQgQnVuZGVzZGF0ZW5zY2h1dHpnZXNldHogd2lkZXJzcHJl
Y2hlIGljaCBkZXIgTnV0enVuZwpzb3dpZSBkZXIgV2VpdGVyZ2FiZSBtZWluZXIgcGVyc29uZW5i
ZXpvZ2VuZW4gRGF0ZW4gZsO8ciBad2Vja2UgZGVyCldlcmJ1bmcgc293aWUgZGVyIE1hcmt0LSBv
ZGVyIE1laW51bmdzZm9yc2NodW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
