Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18194606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xiv+cbpc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWNiY/VA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NG+mvvd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mHkO2zUS0A4u5kdI8y/lPQxc9Q3visyGLD2fNPAW7D4=; b=Xiv+cbpcnaavM5VzEDUEG0JuYK
	14lgZ6sXlTbVDGYSyUEdjxmCy2bRoB5OQeTOBIOnA9L8xrXL1tlc+v+n6ivACID70FaGCD+Re7dM8
	lHk+FJOhOGx2q0wDguH7QkOOgTeNMxI1LCadivNO8alb80TREhnGxgLSMo5OjvbWPOQnBx6zPJSkD
	Ek+5D/BmJkDRHhaZ2258wGMNVLKdUqujE4FiIu2FLpSU6BZ7kFCyza4YWtLwPZKjYowSTtzvgpahM
	ESahfqTS6BprLgjCvu/eug3u3cAae8VSDCd3S9mYXtAEdj4wxIFHuUacQoiKUQMNyw4R3afYdi5Fk
	dynTuy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKGW-00000008Wik-3kOn;
	Thu, 29 Oct 2026 07:09:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKGT-00000008Whp-1kdV
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 07:09:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HHTK3829648
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 07:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=; b=WWNiY/VATgyYMqMt
	kWCFCPZNmeAuzOciF9qUfhoFxfGyr4tnHwXRaiqfTMEuEnbH9eqP+T6hQRblF+T1
	erZfkl44iSRBXVfyF5ZdHmp+V84AO2tlhjCF2PrBjIvJhxoUvFb4F5LmYyscYYz+
	PbdGAr+J4FqOnIpq83+VwbKA933OGl7DZLV9WrX5SX5U56XPy7JA4HAM6TXHLxe5
	sxW0GauZtTQA1mizjVmlGw0QhlAWChW5IMVGTsx4uHOHfK+uB7dfSoNPHVmaktQ2
	TEbS5NZTFeh46Bcd4auuuu5kOcCWvyLlHXTld4rfSz1CyCO6wQDwEsEPTGhj2AwB
	JKULKw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp9dhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 07:09:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso814100eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793257769; x=1793862569; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=NG+mvvd+7QkkBnKAHYHEpMRWQu673McXDqZHHcOQ6bMWABaO3P4OPsNb8WZFIeT+9m
         giEvLjfaxkDcVbNNZq7P/u5NzlJ7B+xcywDv9XH7R3E7P5tIhGPRhU0ST268hX4kDfBT
         5HPzWGp+4lUPaECSGmFqHlkBgShp/OUQFKvlwD4H1wkoO5RjuOkY1GsbTOn0TYph2aCA
         /lk/RBmr4Bd/xpIctXMUi7R57C5PG3N4554m4638M+bN2GDUPjO3/PJQNgfXCQ9ussT9
         UDf6hNAgXsE28DWQXJ5eAPfXdriqE9uFNmG34v/W5ahGkfoK2Y0Jic3rfS3dutsptfEu
         OtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257769; x=1793862569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=oa+kRsce4ZDQtga1kA++JICd4/eYJI6OOCo0mfX+cOdKBeiCruo+ZnAwOdMNwPy2oL
         wtIvU4tFvcT5DR8H8VYsQq3MQd8pswVFXjeKAVd+7k+FXXnZcnGs0+/ebtf4kn1YzMTA
         veXflv0nxL5Tia9w+wklmaej94vv9ZPwPtPI7Gthd4Xl+iKhHjhdcw4zVF9WHTMI/fpj
         FK8rc9P83LjhPf92TsoX1vSm2LI0mwDcy02xhal9m4JR4yqd33tRi6II7Hq5RdZAvEZV
         dpBLVJghSVA1RmEMuSd5TABEfM2IG3PrDiEylTGIcZLltnJD84Bc0XqX2gkuaQgKSl7X
         jKgw==
X-Forwarded-Encrypted: i=1; AKwUvBxycELDVVb4GGFne0NrIH9S6FZoaSVlSv/En5px981e5lf0M+xTObUc2u6EtGMJivhdYitCecVdi4HVtg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIrmLsJRP5w0ahVP4bWHu1nBnBFxoZeboIDBJ43xTr83wEVcSnP
	m8vkbPUXS3SwMgDN9uofuVqozqp81hQgI5BGy81k5OFzeIyL8hvs1UaSHgihL55AwpBz7s/H4rr
	XG/C6Nb5AyD9dFxcS/skQbTCYy9x170woFccnl1EhlqoKqaZLC5z11qumjiMMaUX+XhXOSEU=
X-Gm-Gg: AYBFou0P5A3XeyDNvHQqseFmzErSXLZO29SoIo642AY5KCEgI7ZOaJ/vgQZGfm9j8fn
	OxQ64jXuLesW0KfBi7KhgrTD1kefO1YTJgbii5V48phAVuFBtRQjTJcvEOQQbGOUnCfE8YyesHQ
	cap4hItve6YW251Isl+PMW2G3beX/TJBZxH1NM+kbizAn9HdMNYttnEh1bdOSyN7xyoEfZajUnl
	wv40T0foqD4be/rZTtoSdOWp26enSy82uOwU3ZovObtv1BF7miWWZz8ZzEcXhnOLTN9ndDBBXOo
	aRihkZDakNWtm4IfIi0ukqNG8tpN250uSVVrhqRmrQqH5ICd88YXW5VTXxMY2vpEezN2fawN3Cd
	P+TUDPlPnkssV18HWeOKzuqNkSh/SIwFsAtyxYJKqogVQoyfU2gGtTEQa479J7E8Qv2wQD5LW6q
	YSzKr/BKw5CoIcbGLv7AXpd+2SRnaQlXOsyP+33OlOiXjg9ZmgZ7qAFHtG/BSX+kKv8aTnfPh5i
	w==
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514464c88.15.1793257768831;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514415c88.15.1793257768069;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm12372655c88.23.2026.10.29.00.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:09:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:39:16 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Alexandre Ghiti <alex@ghiti.fr>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
Message-ID: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfXxPz5tD3LN435
 mJh04c6zwsc5t15XyX6izKMwElnCzopYhEQChY3mVfz1rgSIb5JZbwH46zvYRZVxMcEoAxRaOoo
 QLum1fMYREXQT7byTPxjDEtkIyk0i6KB/5ZJWGdtrFf5ySnr6wjXQJWcf/YxjL84I25AMdRzxJE
 MK0siO8/PQpt6CN/pfyUkbx2uq6doCIWvaVr7TKQ6DRr4RVm1M79Id6OriPtTSuLuBZ7Ziw7NEK
 z9OpNlyK0DNghYOFhllaNBKdjBqv+Tb2xCizNdazUa/56hPaVdsk9aNMMBZvF5ath8McawNkVK7
 Wc18fgTDBCN1F7vJnA041yjcZ/UfyY/LQh/RKIGmNVIDCywhkwDDaTx4/sqSuNqyguTurPSsnu3
 Slut/WuZFBnKbvuh+CH8k85k3pR/VexsOJ+6eY+x5PYd0Zg4et7CR0PhwPc9WB2giI+jOH6jtXu
 YfHTewDOTgX0CgetgEQ==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2f12a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=lYWFnMbivg8TxhJFMxEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX9VJ+l3zicme/
 jt8NlKzI64TNbcZJymmaMtBPnVxE7hNsMGCb0DpXcO7fVkHbpk83pVFWd4Y2/6XYztKJePviQmn
 xPpNnGnDnSKT2iI14C7Z5xnm37KxRKQ=
X-Proofpoint-GUID: JwEJGQM7aL78v3WXu3TfKh_-Ng-esT-q
X-Proofpoint-ORIG-GUID: JwEJGQM7aL78v3WXu3TfKh_-Ng-esT-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_000933_716543_06D5E61A 
X-CRM114-Status: GOOD (  44.57  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjksIDIwMjYgYXQgMTE6MzI6MzZBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIE9jdCAyOSwgMjAyNiBhdCA5OjEw4oCvQU0gWmhhbnBlbmcgWmhhbmcKPiA8
emhhbmd6aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgYWxs
LAo+ID4KPiA+IE9uIDEwLzI5LzI2IDExOjE3IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBP
biBUaHUsIE9jdCAyOSwgMjAyNiBhdCA4OjM24oCvQU0gWmhhbnBlbmcgWmhhbmcKPiA+ID4gPHpo
YW5nemhhbnBlbmcuamFzcGVyQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEhp
IEFudXAsIFBhdWwsIEhpbWFuc2h1LAo+ID4gPj4KPiA+ID4+IE9uIDEwLzI5LzI2IDEyOjU1IEFN
LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPj4KPiA+ID4+PiBbLi4uXQo+ID4gPj4+Cj4gPiA+Pj4g
Q2hhbmdlcyBpbiB2MTEKPiA+ID4+PiA9PT09PT09PT09PT09PQo+ID4gPj4+Cj4gPiA+Pj4gUmVi
YXNlZCBvbiBsYXRlc3QgZm9yLW5leHQgYnJhbmNoIG9mIGxpbnV4LXJpc2N2IHRyZWUgKGNvbW1p
dCBhNWFlMWJmNjVjZWUpLgo+ID4gPj4+IEFsc28sIHRlc3RlZCBQTVUgZHJpdmVyIHdpdGggYm90
aCBQTVUgaXJxcyBhbmQgUE1VIFNTRSBldmVudHMuCj4gPiA+Pj4KPiA+ID4+Cj4gPiA+PiBUaGFu
a3MgZm9yIHJlYmFzaW5nIGFuZCB0ZXN0aW5nIHRoZSBzZXJpZXMuIEkgd2FzIGEgbGl0dGxlIHN1
cnByaXNlZAo+ID4gPj4gdG8gc2VlIHYxMSBwb3N0ZWQsIGFzIEkgYW0gc3RpbGwgd29ya2luZyB0
aHJvdWdoIEhpbWFuc2h1J3MgdjEwIHJldmlldwo+ID4gPj4gYW5kIHZhbGlkYXRpbmcgdGhlIGZp
eGVzIG9uIGhhcmR3YXJlLiBJdCB3b3VsZCBoYXZlIGJlZW4gaGVscGZ1bCB0bwo+ID4gPj4gY29v
cmRpbmF0ZSBiZWZvcmUgcmVwb3N0aW5nIHNvIHRoYXQgdGhvc2UgY2hhbmdlcyBjb3VsZCBiZSBp
bmNsdWRlZC4KPiA+ID4+Cj4gPiA+PiBJIGd1ZXNzIHRoaXMgZm9sbG93cyBQYXVsJ3MgcmVxdWVz
dCB0byByZWJhc2Ugb250byByaXNjdi9mb3ItbmV4dC4KPiA+ID4+IEhvd2V2ZXIsIHRoZXJlIGlz
IG9uZSBjaGFuZ2UgYmV5b25kIHRoZSByZWJhc2UgdGhhdCBJIHdvdWxkIGxpa2UgdG8KPiA+ID4+
IGNsYXJpZnk6IHdoeSBkb2VzIHBhdGNoIDQgcmVtb3ZlIHRoZSBzY29wZWRfZ3VhcmQocHJlZW1w
dCkgc2VjdGlvbnMKPiA+ID4+IGZyb20gdGhlIENQVSBob3RwbHVnIHBhdGhzPyBUaGVzZSB3ZXJl
IHByZXNlbnQgaW4gdjEwIFJFU0VORCwgYW5kCj4gPiA+PiB0aGUgbG9jYWwgaGVscGVycyBzdGls
bCByZXRhaW4gdGhlaXIgcHJlZW1wdGlvbi1kaXNhYmxlZCBhc3NlcnRpb25zLgo+ID4gPj4gSXMg
dGhlcmUgYSByZWFzb24gdGhpcyBwcm90ZWN0aW9uIGlzIG5vIGxvbmdlciBuZWVkZWQ/Cj4gPiA+
Cj4gPiA+IFllcywgdGhpcyBpcyBiYXNlZCBvbiBkaXNjdXNzaW9uIHdpdGggUGF1bCB5ZXN0ZXJk
YXkuCj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGlzIGJsb2NraW5nIHRoZSB3aG9sZSBSQVMgQUNQ
SSBzdXBwb3J0Lgo+ID4gPgo+ID4gPj4KPiA+ID4+IFRoZSBjaGFuZ2VzIGRpc2N1c3NlZCBvbiB0
aGUgdjEwIHRocmVhZHMgYXJlIHN0aWxsIG91dHN0YW5kaW5nIGluCj4gPiA+PiB0aGlzIHBvc3Rp
bmc6Cj4gPiA+Pgo+ID4gPj4gLSBQcmVzZXJ2ZSBUQVNLX1RJX0EwL0ExL0EyIGFjcm9zcyBuZXN0
ZWQgZXhjZXB0aW9ucy4KPiA+ID4+IC0gUmVwbGFjZSB0aGUgdGVtcG9yYXJ5IEdVUC1iYXNlZCBw
ZXJmIHVzZXItc3RhY2sgY29weSB3aXRoIG5vZmF1bHQKPiA+ID4+ICAgICB1YWNjZXNzLCBmb2xs
b3dpbmcgdGhlIHg4NiBhcHByb2FjaC4KPiA+ID4+IC0gQWRkcmVzcyB0aGUgcGVyLUNQVSBpbml0
aWFsaXphdGlvbi9wcmVlbXB0aW9uIGNvbmNlcm4uCj4gPiA+PiAtIFNwbGl0IHRoZSBNQUlOVEFJ
TkVSUyB1cGRhdGVzIGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KPiA+ID4KPiA+ID4gVGhlcmUgaXMg
YWx3YXlzIGdvaW5nIHRvIGJlIG5ldyB1cGRhdGVzIHNpbmNlIGl0IHdpbGwgdGFrZQo+ID4gPiB0
aW1lIHRvIGhhcmRlbiB0aGUgU1NFIGltcGxlbWVudGF0aW9uLiBBbGwgdGhlc2UgY2hhbmdlcwo+
ID4gPiBjYW4gYmUgZG9uZSBhcyBzZXBhcmF0ZSBmb2xsb3ctb24gcGF0Y2hlcy4KPiA+ID4KPiA+
ID4+Cj4gPiA+PiBBZGRpdGlvbmFsIGZpeGVzIGZyb20gU2FzaGlrbyByZXZpZXcsIHRoZSBrZXJu
ZWwgdGVzdCByb2JvdCByZXBvcnQsCj4gPiA+PiBhbmQgb3VyIGZvbGxvdy11cCBkZWJ1Z2dpbmcg
YXJlIGFsc28gYmVpbmcgY29uc29saWRhdGVkOgo+ID4gPj4KPiA+ID4+IC0gTk1JLXNhZmUgZW50
cnkgYW5kIGxvY2tkZXAgaXJxZmxhZ3MgdHJhY2tpbmcuCj4gPiA+PiAtIFRoZSB1bnVzZWQtZnVu
Y3Rpb24gd2FybmluZyByZXBvcnRlZCBieSB0aGUga2VybmVsIHRlc3Qgcm9ib3QuCj4gPiA+PiAt
IFJWMzIgdm1hbGxvYyBzeW5jaHJvbml6YXRpb24gYmVmb3JlIG5vZmF1bHQgZml4dXAuCj4gPiA+
PiAtIEZhdWx0aW5nLVBDIHZhbGlkYXRpb24gaW4gdGhlIGtwcm9iZSBzaW5nbGUtc3RlcCBmYXVs
dCBwYXRoLgo+ID4gPj4gLSBQZXItY291bnRlciBTVE9QIGhhbmRsaW5nIGluIFNTRSBlcnJvciBw
YXRocy4KPiA+ID4+IC0gT3JkaW5hcnkgSVJRIENQVS1QTSBub3RpZmllciBvcmRlcmluZyBhbmQg
SVJRIGNsZWFudXAgdHJhY2tpbmcuCj4gPiA+Cj4gPiA+IFNhbWUgY29tbWVudCBhcyBhYm92ZSwg
cGxlYXNlIGRvIHRoaXMgYXMgc2VwYXJhdGUgc2VyaWVzLgo+ID4gPiBObyBwb2ludCBpbiBob2xk
aW5nIGFsbCBvdGhlciBkZXBlbmRlbnQgd29yayBlbmRsZXNzbHkuCj4gPiA+Cj4gPgo+ID4gSSBh
Z3JlZSB0aGF0IHdlIHNob3VsZCB1bmJsb2NrIHRoZSBkZXBlbmRlbnQgd29yay4gSG93ZXZlciwg
SSB3b3VsZAo+ID4gbm90IGNoYXJhY3Rlcml6ZSBhZGRyZXNzaW5nIGEga25vd24sIHJlcHJvZHVj
ZWQgaXNzdWUgYXMgaG9sZGluZyB0aGluZ3MKPiA+IHVwIGVuZGxlc3NseS4KPiA+Cj4gPiA+Pgo+
ID4gPj4gSW4gcGFydGljdWxhciwgSGltYW5zaHUgaWRlbnRpZmllZCB0aGUgbWlzc2luZyBwcmVz
ZXJ2YXRpb24gb2YKPiA+ID4+IFRBU0tfVElfQTAvQTEvQTIgYWNyb3NzIG5lc3RlZCBleGNlcHRp
b25zIFsxXS4gRm9sbG93aW5nIGhpcyByZXZpZXcsCj4gPiA+PiBJIHZhbGlkYXRlZCB0aGUgZml4
IHdpdGggaGFyZHdhcmUgQS9CIHRlc3Rpbmc6IHJlbW92aW5nIGl0IHJlcHJvZHVjZWQKPiA+ID4+
IGNvcnJ1cHRpb24sIHdoaWxlIHRoZSBmaXhlZCBrZXJuZWwgY29tcGxldGVkIHRoZSBzYW1lIHRl
c3Qgc2VxdWVuY2UuCj4gPiA+PiBUaGlzIGFsc28gZ2l2ZXMgdXMgYSBzb2xpZCBiYXNpcyBmb3Ig
cmVwbGFjaW5nIHRoZSB0ZW1wb3JhcnkgR1VQCj4gPiA+PiB3b3JrYXJvdW5kIHdpdGggbm9mYXVs
dCB1YWNjZXNzLgo+ID4gPj4KPiA+ID4+IFBhdWwsIHBsZWFzZSBob2xkIG9mZiBvbiB0YWtpbmcg
dGhpcyB2ZXJzaW9uIGludG8gZm9yLW5leHQgdW50aWwKPiA+ID4+IHRoZXNlIGZpeGVzIGFyZSBp
bmNsdWRlZC4gVGhlIHJlYmFzZSBhbmQgUE1VIHRlc3RpbmcgYXJlIHVzZWZ1bCwgYnV0Cj4gPiA+
PiB0aGVyZSBhcmUgc3RpbGwgb3V0c3RhbmRpbmcgY29ycmVjdG5lc3MgaXNzdWVzLgo+ID4gPj4K
PiA+ID4+IEkgd2lsbCBjb25zb2xpZGF0ZSB0aGUgY2hhbmdlcyBhbmQgcG9zdCB2MTIgYWdhaW5z
dCByaXNjdi9mb3ItbmV4dCwKPiA+ID4+IHdpdGggYW4gdXBkYXRlZCBjaGFuZ2Vsb2cgYW5kIHZh
bGlkYXRpb24gcmVzdWx0cy4gTGV0J3MgY29vcmRpbmF0ZQo+ID4gPj4gdGhlIG5leHQgcG9zdGlu
ZyB0byBrZWVwIGV2ZXJ5dGhpbmcgdG9nZXRoZXIuCj4gPiA+Pgo+ID4gPj4gVGhhbmtzLAo+ID4g
Pj4gWmhhbnBlbmcKPiA+ID4+Cj4gPiA+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9h
czc5TUh0TllkLVZiVXVnQGh1LWhpbWNoYXUtYmxyLnF1YWxjb21tLmNvbS8KPiA+ID4KPiA+ID4g
UmVnYXJkcywKPiA+ID4gQW51cAo+ID4KPiA+IEknbGwgcG9zdCBhIGZvY3VzZWQgdjEyIGJlZm9y
ZSB0aGlzIHdlZWtlbmQgd2l0aCB0aGUgaW1tZWRpYXRlCj4gPiBjb3JyZWN0bmVzcyBmaXhlcy4g
RnVydGhlciBpbXByb3ZlbWVudHMgY2FuIGZvbGxvdyBzZXBhcmF0ZWx5Lgo+IAo+IExpbnV4LTcu
NCBtZXJnZSB3aW5kb3cgY2xvc2VzIGVuZC1vZiB0aGlzIHdlZWsgc28geW91ciB2MTIKPiB3aWxs
IGJlIHRvbyBsYXRlIGZvciBpdCBoZW5jZSBJIHN1Z2dlc3Qgc2VuZGluZyBpbmNyZW1lbnRhbCBm
aXhlcwo+IHNlcGFyYXRlbHkuCj4KCkhpIFpoYW5wZW5nLAoKSSBhZ3JlZSB3aXRoIEFudXAuIElN
TywgU1NFIGFzIGEgZmVhdHVyZSBpcyByZWFkeS4gSXQgd2lsbCBiZSBlYXNpZXIKZm9yIHlvdSBh
bmQgZm9yIG1lIGlmIHRoZSBwYXRjaGVzIGFyZSBtZXJnZWQuIEl0IGhhcyBiZWNvbWUgYSBwYWlu
IHRvCnNlbmQgcmV2aXNlZCBSQVMgcGF0Y2hlcyBiZWNhdXNlIG9mIHRoZSBkZXBlbmRlbmN5LlRo
ZSBpc3N1ZSB0aGF0IEkKaWRlbnRpZmllZCBjYW4gYmUgc2VudCBpbmNyZW1lbnRhbGx5IGluIGNv
bWluZyB3ZWVrcy4KCkkgd291bGQgcmVxdWVzdCBQYXVsIHRvIHBpY2sgdXAgdGhlIFNTRSBwYXRj
aGVzIG5vdy4KClJlZ2FyZHMKSGltYW5zaHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
