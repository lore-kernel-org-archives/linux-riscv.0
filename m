Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09308606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 05:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JZVaUx+d;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEyKhNh4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bqi3hDLi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NdrjLR354es7jCdv6iO6l9VqX53jR2Dap17rlZ728m0=; b=JZVaUx+dD9ZHcndos41Cp67qV0
	wwotWVVQm6YTqqfKMp3FSTpNgH2FaqQpsduEPCW3hYRFWXJTpcMXqf8FxeKTUr9HZI9jJC6hnjoN8
	tev+oKIdyV6XphXIN6s/mclnl0spuWs2gbVuEGRcPgMpwoXLlyOKwp963E7rd72hALaj8qdPvQ/lu
	tu4uBHGCf3g0uYc5YMSnaEPpbUvY2BcEEoEVEr1vzeJOj1hjlgIHbhoA5jXmUFYNvdD/o0svCUSxC
	teZbu8PQ7ExwwgkluXBhENxBpuPAGtyUJdpagADkSvTDhCvTPf2/gITLEeFfDry2hff88HE38/GUT
	PptoxUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOq6M-00000007tNq-1oZ5;
	Thu, 05 Nov 2026 05:33:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOq6J-00000007tNV-1zkt
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 05:33:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50obNN4051675
	for <linux-riscv@lists.infradead.org>; Thu, 5 Nov 2026 05:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=; b=VEyKhNh4XXvkgpDi
	OMY2Y+5ggSH1HM5rU4kWJvRos5uJxhl/RN4lJr52oZyv8/3b8UEtB4BwqGUafpyk
	1eutvG83UEqM2gScVG4kmNznp5PVhqbzgt5QKY6Pk80q7NhBTkWy8+R2RN2INifm
	g1gG87ueC1DtSMDD+5qzQWNyGRbyi7J2Dtcvv+u7g0Ki0ISj6YYV1Q8p3G6jRSPz
	9pY/6T6RMFQtDnQ+FctTMVy4H9OxY83zAfkvXZwpXX7t+xpZ7WW0tqD6BE2nass5
	+KuASWtbBJ7zFmT/7m0UWSSijVWPpPGKxO2LTBPBxRaTWEpxBp9LaEsBleP+er26
	2oZEwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv2svf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 05:33:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1892776eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 21:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856805; x=1794461605; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=;
        b=Bqi3hDLihJCtI8RHHA+pGUaFrtlvqAKUWtXbuSffUgz/0hduffTdsKnngtFYunH3Hs
         m3glh4Ddi1xHF/kvPhptxAsJP1SY1oCXbU46KUmT6iQT4RZSRaqTlsuzMxSjXoITnvBr
         BTXGUHBVy2kcogdXfbYwu4mOEQoRjKR/Jukgk6DUBBYwy+EfQgEdE70YkbzkP74bugeJ
         c/BFUroO8KKtZa/DyR7II60TjY0pgfZfEkuVPB+AfcTe9QT4GuVFSo0J1XBe2SFOnr9R
         gkvpeD3rIH0wbZseKj8tQkEz6OQ/Zuc6med/zhcJ44WrC+NtXfX8X1HivxTrM1JwuD2f
         I5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856805; x=1794461605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=;
        b=mwtUwSggEqBmO+zx2b7LYmtrA2Ek6xcSSswT/L0USt2o7h/KxPRzMk8fMjzxK/cMeE
         t9kkPUKODmhLUg8iarf564WNh/yoXXcbbBvyDXCfDNFb/HoWwYgVYIFXWVbPOeYfgtOI
         AFqqLAp87LlqZAJ0goxKgYI9Bsy0TeYtXBNuL2bmIx2dv2WWnfdC+o9DG683MIFgrwNz
         wK5w7noEaCNSyEQTexb02rN3wIlZ6WUEP+VKnAk/4swWcuGkaudMKQOW8y9umvienoAO
         jtMS5hUs0+SlBP/jMVqY3fh/wlD6I0Sh6MXXEdLbuMro9itp007+D3b6+WQpOX1gI3Jk
         sIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuAb0SuouVr2y1e8vYorJJVK1Pong1nvM7B+bopUgt9fmEszEYMbq5Pz1tzJdRmxWwpJTkOeWHPhiOVg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9yKoRq5csga5hBGgRUX0fzC9nvT4ko7aYcAhra/0ZbwwGl2Z6D
	Wo3by7hYQK9GO/L7aIrdzoYTCTr+5vZVKPFgRQuINHYcftgxeHCMrfLgHONlcEY7+4De6rMs/O5
	Sk4qlac+vnRMSzzS3r6TsFfXNiHzTfm/L9B5WXTdYFj7yCZydhQr2lMX2YDrLe0ZOdOsbOvs=
X-Gm-Gg: AYBFou1vGKgRomICnC2rD3oZ65DZRNKvDeRqoJRL0wesCQr7fbD+VuAvUWK446UlapU
	hjWEziuwy94apLBVcuvOIN7eYknpcMPhMB+JgC23xxYFhtm90ERl4JZ8jvl/hbDG1YLg5wkYlyP
	4CdknSf7G5T8xKgMu4FhX43sAG5AxpCbVPG7lrZvvscQQqwVakLYKLQXJXxZvke+owAf1Jj5xNN
	6DGyV49044In4Zp1H179VQzZsOCHakvUDg3TYh2pmIIHY8rUBbMLpKVbY6NzO1jg9xMeGfmCDdI
	bS1SivowbWAtRgfkyxHkM6Rc6rjNRkK8BrWRU4/psrQM5WwciyxF8h1Wk+65Hx0cFEopnBrnddA
	21ADOKDAck2TVN8gz+8Hpkib0Xz0o144/RK8V6zNpa7h95iKJZiZ9P7KxLOa8oLDdzSOybFwfin
	U59Dml2gA0o2A0VOv7hXNbxhPZKsjbenVWyZF4xSrWocCcdinJMKGj5KjhDljI2sj1fjJB4gTJ
X-Received: by 2002:a05:7301:db8a:b0:36d:394d:e690 with SMTP id 5a478bee46e88-36d395d342amr3970077eec.40.1793856804916;
        Wed, 04 Nov 2026 21:33:24 -0800 (PST)
X-Received: by 2002:a05:7301:db8a:b0:36d:394d:e690 with SMTP id 5a478bee46e88-36d395d342amr3970038eec.40.1793856804160;
        Wed, 04 Nov 2026 21:33:24 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm12148541eec.15.2026.11.04.21.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:33:23 -0800 (PST)
Date: Thu, 5 Nov 2026 11:03:16 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, qingfang.deng@linux.dev,
        shuah@kernel.org, thecharlesjenkins@gmail.com,
        cp0613@linux.alibaba.com
Subject: Re: [PATCH v7 7/8] perf tests: add noinline to __test_function
Message-ID: <auwVHAC4iPfdXD4c@hu-himchau-blr.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
 <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec1526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=3ntduUHgHJ2MHpqTwYcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfXwrCqDdHSZsSj
 urMQzoGFpUjzcy0oiT4+b+IQ3Dln3gWVz/dc3p0ed5gtC82oUh8zRtnlykgG2JGbHI8+4Z51AHL
 K8t2SXjY0dpOEEmsxe1wP3C+Y1FnwZI=
X-Proofpoint-ORIG-GUID: qiKOnZR5CQPlnJf4zbS7R5aE4MEY9BKc
X-Proofpoint-GUID: qiKOnZR5CQPlnJf4zbS7R5aE4MEY9BKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX4qW7BCXNRbrQ
 N/QmOuZqER61mAhOXaLlQCDq+8/RxAxEnO3b1Ow1ftWtouifoCb4+EcdXhNBv9rg5TcsJYSrRMa
 YtJc+iJSaX/n/msJ/T7ko9zh/SvgBWivECOtZEafvA/lssWuLhhfhIDleKM8yPeK+VRPIqgK1Se
 6ff77bTllkXxPHQziyLBnRv4nvrAwN36U83HHSu5Oc15qfu/S0lYeCQjtAfOsDJIfsDcJVOwi9e
 rGHDMJznBYm+HoFzfrDGDN28koeuzhq8tdE3lP0JKynNj5c+0/g0PQESeE4CknxHYUAGvzcXkMh
 /elku15DLlBgxy/vsh+lRWfNHmZXx+wggRjR66PiQALI3UCja2RsJdt37ekQMRRDoINeOD/sUW1
 d6jwanceELUOZwjC3FXGS+yAfwYPf1Lxl5tj7UpeCm99FFcKmoGOO8bieGQ5pwblEhkYSIoVGOy
 H/Ucr4l5+zk3q8OHdng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_213327_654291_F6692B4C 
X-CRM114-Status: GOOD (  26.32  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMDM6NTI6MjBQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gT24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMjo0MOKAr0FNIEhpbWFuc2h1IENoYXVoYW4K
PiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Cj4gPiBJbiB0
aGUgYnJlYWtwb2ludCBzaWduYWwgaGFuZGxlciB0ZXN0LCBhIGJyZWFrcG9pbnQgaXMgc2V0IG9u
Cj4gPiBfX3Rlc3RfZnVuY3Rpb24uIENvbXBpbGVyIG1heSBvcHRpbWl6ZSBhbmQgaW5saW5lIF9f
dGVzdF9mdW5jdGlvbi4KPiA+IFRoaXMgY2F1c2VzIGZhaWx1cmUgaW4gdGhlIHRlc3QuCj4gPgo+
ID4gQWRkIG5vaW5saW5lIHRvIF9fdGVzdF9mdW5jdGlvbiBzbyB0aGF0IGl0IGlzIG5vdCBpbmxp
bmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNo
YXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4KPiBSZXZpZXdlZC1ieTogSmVzc2UgVGF1YmUgPGp0YXVi
ZXBlQHJlZGhhdC5jb20+Cj4gCj4gSSB3b3VsZCByZXNlbmQgdGhpcyB0byB0aGUgcGVyZiBsaXN0
IGFuZCBub3QgaW4gYSBwYXRjaCBzZXQgYXMgaXQgaXMgYQo+IHNlcGFyYXRlIGZpeC4KcGVyZiBs
aXN0IGlzIGFscmVhZHkgaW4gdGhlIFRvOiBsaXN0CgpSZWdhcmRzCkhpbWFuc2h1Cgo+IAo+IFRo
ZXJlIGlzIGFsc28gYW5vdGhlciBmaXggdG8gZGF0YV9icmVha3BvaW50LmPigI4gdGhhdCBpIGhh
dmUgYmVlbgo+IG1lYW5pbmcgdG8gc2VuZCBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9Nci1C
b3NzbWFuL2xpbnV4L2NvbW1pdC9kYjRmYWE1MmE2NmY2YjcyNjVjZDM5N2EyZDQ0ZDdkMzhjM2Zk
ZmI3Cj4gCj4gVGhhbmtzLAo+IEplc3NlIFRhdWJlCj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL3Rl
c3RzL2JwX3NpZ25hbC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL2Jw
X3NpZ25hbC5jIGIvdG9vbHMvcGVyZi90ZXN0cy9icF9zaWduYWwuYwo+ID4gaW5kZXggZjU4MGJh
NzQ4NmIxLi5jYzRhMjcyMjQ4ODQgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL2Jw
X3NpZ25hbC5jCj4gPiArKysgYi90b29scy9wZXJmL3Rlc3RzL2JwX3NpZ25hbC5jCj4gPiBAQCAt
NTQsNyArNTQsNyBAQCBhc20gKAo+ID4gICAgICAgICAicmV0XG4iCj4gPiAgICAgICAgICIucG9w
c2VjdGlvblxuIik7Cj4gPiAgI2Vsc2UKPiA+IC1zdGF0aWMgdm9pZCBfX3Rlc3RfZnVuY3Rpb24o
dm9sYXRpbGUgbG9uZyAqcHRyKQo+ID4gK3N0YXRpYyBub2lubGluZSB2b2lkIF9fdGVzdF9mdW5j
dGlvbih2b2xhdGlsZSBsb25nICpwdHIpCj4gPiAgewo+ID4gICAgICAgICAqcHRyID0gMHgxMjM0
Owo+ID4gIH0KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
