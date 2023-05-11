Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3CC77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCQ9KM7hG8VlHh/WlPFk7J9kGKZURGl+qjAKpJu5ukI=; b=zcLWUdcZXK8FcZ
	XwHfYLZSm9MqYryvdRHNFqhx7cGP4CfVA+RgNwaRFpyjXu9lp3R3rKOdnYxadFV1M00aRsV2nbng1
	pW6BtFmPE55t6R2+FwuuQ44hzP19fuuyitM6pK+dluYinqa7BTPpwvUd9QOmq7BtI5JOgkjsZTMkh
	MjeKbruxlEXt0qwf9s3ZaCEp63EjKziEsCkMBU8KMOagGi9B06ZwDo8K2yIarncwk2XsTLLFkpcxd
	F5V5/7UVkqJBAOukRp3+Kcej1Cfnbwh7jGTTCD5uuRbmSOY5Nb8FT2A9We5gdLqdC/+x5XqPOzajN
	ijbf9/lCr4ITgJYCRHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0Q1-0085c7-1k;
	Thu, 11 May 2023 07:08:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0Py-0085bm-2w
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:08:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B1C663F99;
	Thu, 11 May 2023 07:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E37C433EF;
	Thu, 11 May 2023 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683788928;
	bh=zuPvQjQoQD9hdY08fQaldTDPx+NyuNEmOMzEhWVsa0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUPZPR4WqDkAiew9KPB230+noVury3/Swjtl0kW77vKyHy021g6wvAZc23kZxsK4i
	 NhSGLhKmbmVoxtzTVSdccMFwIMXZfSyy3Xc8Jyo/K42OVTQqiPUAYKAu+dYoTlA1Ht
	 MDkkcWbQozmVeD/oVJuqWk3wSLlQFdVZZNN77uufN+4c2tVz0tYtDWO4Pu0FTgHs3C
	 IY7hTIR5VNuIvOjajBT8CF1eC6IpAw/VqqxrxDK9XAsUET/yEaekBWgOv3ZnNnA2GA
	 CyWfc/JptBe5UZJL3azM/ZUCeYu8IUIZUB3pKErthF3k3FR4UiApfh2/FKRjYZU5zs
	 d0dXIV1nRBuDA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 suagrfillet@gmail.com, jszhang@kernel.org, e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V9 2/4] riscv: ftrace: Add ftrace_graph_func
In-Reply-To: <20230510101857.2953955-3-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
 <20230510101857.2953955-3-suagrfillet@gmail.com>
Date: Thu, 11 May 2023 09:08:45 +0200
Message-ID: <87zg6bjqf6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_000851_037275_C8C4607C 
X-CRM114-Status: GOOD (  11.73  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEhlcmUgaW1wbGVt
ZW50cyBmdHJhY2VfZ3JhcGhfZnVuYyBhcyB0aGUgZnVuY3Rpb24gZ3JhcGggdHJhY2luZyBmdW5j
dGlvbgo+IHdpdGggRlRSQUNFX1dJVEhfUkVHUyBkZWZpbmVkLgo+Cj4gZnVuY3Rpb25fZ3JhcGhf
ZnVuYyBnZXRzIHRoZSBwb2ludCBvZiB0aGUgcGFyZW50IElQIGFuZCB0aGUgZnJhbWUgcG9pbnRl
cgo+IGZyb20gZnJlZ3MgYW5kIGNhbGwgcHJlcGFyZV9mdHJhY2VfcmV0dXJuIGZvciBmdW5jdGlv
biBncmFwaCB0cmFjaW5nLgo+Cj4gSWYgRlRSQUNFX1dJVEhfUkVHUyBpc24ndCBkZWZpbmVkLCB0
aGUgZW5hYmxlL2Rpc2FibGUgaGVscGVycyBvZgo+IGZ0cmFjZV9ncmFwaF9bcmVnc11fY2FsbCBh
cmUgcmV2aXNlZCBmb3Igc2VydmluZyBvbmx5IGZ0cmFjZV9ncmFwaF9jYWxsCj4gaW4gdGhlICFG
VFJBQ0VfV0lUSF9SRUdTIHZlcnNpb24gZnRyYWNlX2NhbGxlci4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IEd1byBSZW4g
PGd1b3JlbkBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgoKWy4uLl0KCj4gKwo+ICsJLy8gYWx3YXlzIHNhdmUgdGhlIEFCSSByZWdzCj4gKwo+
ICsJUkVHX1MgeDEwLCBQVF9BMChzcCkKPiArCVJFR19TIHgxMSwgUFRfQTEoc3ApCj4gKwlSRUdf
UyB4MTIsIFBUX0EyKHNwKQo+ICsJUkVHX1MgeDEzLCBQVF9BMyhzcCkKPiArCVJFR19TIHgxNCwg
UFRfQTQoc3ApCj4gKwlSRUdfUyB4MTUsIFBUX0E1KHNwKQo+ICsJUkVHX1MgeDE2LCBQVF9BNihz
cCkKPiArCVJFR19TIHgxNywgUFRfQTcoc3ApCgpSZWFsbHkgYSBuaXQvbW9yZSBnZW5lcmFsIGNv
bW1lbnQ7IHRoZSBSSVNDLVYgYXNzZW1ibHkgZmlsZXMgaXMgYSBiaXQKYWxsIG92ZXIgdGhlIHBs
YWNlIGluIHRlcm1zIG9mIHN0eWxlOyBXaGVuIGRvaW5nIGNoYW5nZXMsIHRyeSB0bwpwcmV0dGlm
eSBpdCB3aXRoIHByb3BlciB0YWJzLCBhbmQgbWF5YmUgd2UnbGwgaGF2ZSBldmVudHVhbApjb25z
aXN0ZW5jeS4gOy0pCgpObyB0YWJzIF5eXi4uLgoKPiArCj4gKwkvLyBzYXZlIHRoZSBsZWZ0b3Zl
ciByZWdzCj4gKwo+ICsJLmlmIFxhbGwgPT0gMQo+ICAJUkVHX1MgeDIsICBQVF9TUChzcCkKPiAg
CVJFR19TIHgzLCAgUFRfR1Aoc3ApCj4gIAlSRUdfUyB4NCwgIFBUX1RQKHNwKQo+ICAJUkVHX1Mg
eDUsICBQVF9UMChzcCkKPiAtCXNhdmVfZnJvbV94Nl90b194MzEKPiArCVJFR19TIHg2LCAgUFRf
VDEoc3ApCj4gKwlSRUdfUyB4NywgIFBUX1QyKHNwKQo+ICsJUkVHX1MgeDgsICBQVF9TMChzcCkK
PiArCVJFR19TIHg5LCAgUFRfUzEoc3ApCj4gKwlSRUdfUyB4MTgsIFBUX1MyKHNwKQo+ICsJUkVH
X1MgeDE5LCBQVF9TMyhzcCkKPiArCVJFR19TIHgyMCwgUFRfUzQoc3ApCj4gKwlSRUdfUyB4MjEs
IFBUX1M1KHNwKQo+ICsJUkVHX1MgeDIyLCBQVF9TNihzcCkKPiArCVJFR19TIHgyMywgUFRfUzco
c3ApCj4gKwlSRUdfUyB4MjQsIFBUX1M4KHNwKQo+ICsJUkVHX1MgeDI1LCBQVF9TOShzcCkKPiAr
CVJFR19TIHgyNiwgUFRfUzEwKHNwKQo+ICsJUkVHX1MgeDI3LCBQVF9TMTEoc3ApCj4gKwlSRUdf
UyB4MjgsIFBUX1QzKHNwKQo+ICsJUkVHX1MgeDI5LCBQVF9UNChzcCkKPiArCVJFR19TIHgzMCwg
UFRfVDUoc3ApCj4gKwlSRUdfUyB4MzEsIFBUX1Q2KHNwKQo+ICsKPiArCS8vIHNhdmUgczAgaWYg
RlBfVEVTVCBkZWZpbmVkCj4gKwo+ICsJLmVsc2UKPiArI2lmZGVmIEhBVkVfRlVOQ1RJT05fR1JB
UEhfRlBfVEVTVAo+ICsJUkVHX1MgeDgsICBQVF9TMChzcCkKPiArI2VuZGlmCj4gKwkuZW5kaWYK
PiAgCS5lbmRtCj4gIAo+IC0JLm1hY3JvIFJFU1RPUkVfQUxMCj4gKwkubWFjcm8gUkVTVE9SRV9B
QklfUkVHUywgYWxsPTAKPiArCVJFR19MIHQwLCAgUFRfRVBDKHNwKQo+ICAJUkVHX0wgeDEsICBQ
VF9SQShzcCkKPiArCVJFR19MIHgxMCwgUFRfQTAoc3ApCj4gKwlSRUdfTCB4MTEsIFBUX0ExKHNw
KQo+ICsJUkVHX0wgeDEyLCBQVF9BMihzcCkKPiArCVJFR19MIHgxMywgUFRfQTMoc3ApCj4gKwlS
RUdfTCB4MTQsIFBUX0E0KHNwKQo+ICsJUkVHX0wgeDE1LCBQVF9BNShzcCkKPiArCVJFR19MIHgx
NiwgUFRfQTYoc3ApCj4gKwlSRUdfTCB4MTcsIFBUX0E3KHNwKQo+ICsKPiArCS5pZiBcYWxsID09
IDEKPiAgCVJFR19MIHgyLCAgUFRfU1Aoc3ApCj4gIAlSRUdfTCB4MywgIFBUX0dQKHNwKQo+ICAJ
UkVHX0wgeDQsICBQVF9UUChzcCkKPiAtCS8qIFJlc3RvcmUgdDAgd2l0aCBQVF9FUEMgKi8KPiAt
CVJFR19MIHg1LCAgUFRfRVBDKHNwKQo+IC0JcmVzdG9yZV9mcm9tX3g2X3RvX3gzMQo+ICsJUkVH
X0wgeDYsICBQVF9UMShzcCkKPiArCVJFR19MIHg3LCAgUFRfVDIoc3ApCj4gKwlSRUdfTCB4OCwg
IFBUX1MwKHNwKQo+ICsJUkVHX0wgeDksICBQVF9TMShzcCkKPiArCVJFR19MIHgxOCwgUFRfUzIo
c3ApCj4gKwlSRUdfTCB4MTksIFBUX1MzKHNwKQo+ICsJUkVHX0wgeDIwLCBQVF9TNChzcCkKPiAr
CVJFR19MIHgyMSwgUFRfUzUoc3ApCj4gKwlSRUdfTCB4MjIsIFBUX1M2KHNwKQo+ICsJUkVHX0wg
eDIzLCBQVF9TNyhzcCkKPiArCVJFR19MIHgyNCwgUFRfUzgoc3ApCj4gKwlSRUdfTCB4MjUsIFBU
X1M5KHNwKQo+ICsJUkVHX0wgeDI2LCBQVF9TMTAoc3ApCj4gKwlSRUdfTCB4MjcsIFBUX1MxMShz
cCkKPiArCVJFR19MIHgyOCwgUFRfVDMoc3ApCj4gKwlSRUdfTCB4MjksIFBUX1Q0KHNwKQo+ICsJ
UkVHX0wgeDMwLCBQVF9UNShzcCkKPiArCVJFR19MIHgzMSwgUFRfVDYoc3ApCj4gIAo+ICsJLmVs
c2UKPiArI2lmZGVmIEhBVkVfRlVOQ1RJT05fR1JBUEhfRlBfVEVTVAo+ICsJUkVHX0wgeDgsICBQ
VF9TMChzcCkKPiArI2VuZGlmCj4gKwkuZW5kaWYKPiAgCWFkZGkJc3AsIHNwLCBQVF9TSVpFX09O
X1NUQUNLCj4gIAkuZW5kbQo+ICsKPiArCS5tYWNybyBQUkVQQVJFX0FSR1MKPiArCWFkZGkJYTAs
IHQwLCAtRkVOVFJZX1JBX09GRlNFVAkvLyBpcAo+ICsJbGEJYTEsIGZ1bmN0aW9uX3RyYWNlX29w
Cj4gKwlSRUdfTAlhMiwgMChhMSkJCQkvLyBvcAo+ICsJbXYJYTEsIHJhCQkJCS8vIHBhcmVudF9p
cAo+ICsJbXYJYTMsIHNwCQkJCS8vIGZyZWdzCj4gKwkuZW5kbQoKLi4uYnV0IGhlcmUuLi4KCj4g
Kwo+ICAjZW5kaWYgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+ICAKPiAr
I2lmbmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTCj4gIEVOVFJZKGZ0cmFjZV9j
YWxsZXIpCj4gIAlTQVZFX0FCSQo+ICAKPiBAQCAtMTEwLDMzICsyMjksMjggQEAgZnRyYWNlX2dy
YXBoX2NhbGw6Cj4gIAlqciB0MAo+ICBFTkRQUk9DKGZ0cmFjZV9jYWxsZXIpCj4gIAo+IC0jaWZk
ZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUwo+ICsjZWxzZSAvKiBDT05GSUdfRFlO
QU1JQ19GVFJBQ0VfV0lUSF9SRUdTICovCj4gIEVOVFJZKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiAt
CVNBVkVfQUxMCj4gLQo+IC0JYWRkaQlhMCwgdDAsIC1GRU5UUllfUkFfT0ZGU0VUCj4gLQlsYQlh
MSwgZnVuY3Rpb25fdHJhY2Vfb3AKPiAtCVJFR19MCWEyLCAwKGExKQo+IC0JbXYJYTEsIHJhCj4g
LQltdglhMywgc3AKPiArCVNBVkVfQUJJX1JFR1MgMQo+ICsJUFJFUEFSRV9BUkdTCj4gIAo+ICBm
dHJhY2VfcmVnc19jYWxsOgo+ICAJLmdsb2JhbCBmdHJhY2VfcmVnc19jYWxsCj4gIAljYWxsCWZ0
cmFjZV9zdHViCj4gIAo+IC0jaWZkZWYgQ09ORklHX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+IC0J
YWRkaQlhMCwgc3AsIFBUX1JBCj4gLQlSRUdfTAlhMSwgUFRfRVBDKHNwKQo+IC0JYWRkaQlhMSwg
YTEsIC1GRU5UUllfUkFfT0ZGU0VUCj4gLSNpZmRlZiBIQVZFX0ZVTkNUSU9OX0dSQVBIX0ZQX1RF
U1QKPiAtCW12CWEyLCBzMAo+IC0jZW5kaWYKPiAtZnRyYWNlX2dyYXBoX3JlZ3NfY2FsbDoKPiAt
CS5nbG9iYWwgZnRyYWNlX2dyYXBoX3JlZ3NfY2FsbAo+ICsJUkVTVE9SRV9BQklfUkVHUyAxCj4g
KwlqciB0MAoKLi4uYW5kIG5vdCBoZXJlLgoKTm90IGEgYmlnZ2llISBOaWNlIGNsZWFudXAhCgpB
Y2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
