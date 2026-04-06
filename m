Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5897E9D835
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 04:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFp8awX4OjnSxTccnRaviYbCgkap5JPbpBrh+MKvzOQ=; b=I9wEjWQzO6dnmW
	S3JpbiuFdMgoCXS81pX+5cflY/IjeA377YEhjKh1t1gYPicuoZKrbBG+9q5/j9rvVIYAHm0goUPcb
	YJciwgCzxrXj3RKryzkL0KckSrWyDiFYAB6AOy6ghz6NGzLvCC31JCKnAtak2EHwEs9cnmjgE8rP1
	o7LPMe1gxsQHajNW8kEpvQT4VRxQ2c7IB38RuK4TYEeh7ui0YOzo3v9Id9Q2OSalaz8dJlVDMUkAb
	gqfqU0oHDXiWENxiWLHcDe8p/OzcWMigBav7TURd/aOgAyJZLieF7XvJauo+tc8ghZRDjBpPDAR5a
	z80erpW4nE5pSEpE1GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bt4-00000004mCO-273C;
	Mon, 06 Apr 2026 04:48:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bt1-00000004mC1-45wG
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 04:48:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AU2s01809860
	for <linux-riscv@lists.infradead.org>; Mon, 6 Apr 2026 04:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUoLovshS45ImVzQne7VV0jmQ4Q7XifTi93AwcLyVE=; b=gAjZ4b5+ub7+gutT
	UzgUNf+hSNPDuBxb+uSuM8DBZhmd+EAgMmYf1HHt/nSnTNZps4cw1f8+Nsj71J4G
	fLHGgftFPTZQgk39ZwZQEVChnyxe/Jhgv0UYDjAD/2lCdJFoX+Y/asvn8VPOGUJp
	2CfUIsVn6U/iMqnmU1LVE1wzEvQydTCidKhCYMVtLi4dxF6QFtdtLppxQxaxGqzq
	VgyRhBmqrRRRQsODtym/rUzjy+k64w/RxPqGCb4RrPdINZFAzWrecrlsjhuOyrOB
	GYBS/Yst4/sCq/9NLJU9BK/eez9IPRLL5eWvFa30nOBiHitZ5PHzsmPUDK6p22lV
	WRcFyA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7ubuy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 04:48:29 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4713cc31e23so1776775b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 21:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775450909; cv=none;
        d=google.com; s=arc-20240605;
        b=bfb8z0x1Y5JIp6ByLDnRXRL71ncK1kuKmTt6QshX8Z7E8XgeNqogUJB53zVB6aTMjx
         IMzJJe07CfeRPO0TWqKpxeoxFVMZhfMWCvyDhIyc/mMkWUwZZSR8fP0Thp9PKgPN0hT1
         LwHMqnoh/duwsvDdyhQn4lHf6AjkAtwLUCXpCdMNL34UPdm2Xvm+GZALw+VJH0nDC2kP
         +80vhBxSxDruqA50Dcs0LDuWJdtg7+P+/7mdKmKPY3NB5zNFDbvTupv5fYjiEncGMps2
         gXvo1M0JbBs4h+RyA/2SLSoStuZhz1p9M9hayTrKV5bHysYffkrcylNDePnaIFK1N1IG
         YsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXUoLovshS45ImVzQne7VV0jmQ4Q7XifTi93AwcLyVE=;
        fh=XjaXAsKxbvkTQzJzUrQwVuKgUti/6v98+g2hlyijnRc=;
        b=dEbdzJc2KfL7L9Kn2+VQy7wYSGtz6TUe9MG81Oudyuda7trGntClQREsHbQllqFg/8
         QvSAbtWfQvYgQcTvfj6DWG1YmGz7i2Mu9PIe8cMTEoGQUNPOZL+1cmGrRk8BjRtzqZQd
         Q2ELGxbI8OgZuTOnY9aeri/NKOXFrMhLnoTP861bY53EPWkFUZAEpxaBKfxhzzvwPpMo
         6x3TCNN/AmzrHACZhqI5JhDyCvSkL8EThxPMaQEUzoysFwxoKgXQ5JUcEzZyIZ5ypMME
         KWAcLfrdc43lhaMEc9WwOL4WMm2TecE7J+lH/5ZXxQAfbghdzLmcADuFBAboIgtn5Lgx
         ghaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775450909; x=1776055709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXUoLovshS45ImVzQne7VV0jmQ4Q7XifTi93AwcLyVE=;
        b=PR4ndUPcjUr6yypmoka8FSHztz9Q9HS/PUftTJ1Ljhs0ahyb07qwwSYDnw7GJMo6Iv
         8IwW5SPj1aubnc0gwxAyj8zXNpaOwepybKUBG9lx/7nH86F46gRcI5oYBhS8CQlt8sEX
         BzbBZaI3pEKLg69Y+AZGLwZyCOyVMI07MJJPOuSvlCc5XPid/txKUSEVBLxgBH+4jKht
         VP2nZmX+Y1M0kTUH/v3fVFvJoQ9UHFD2cVbur/5cone5JmTzN4qWG6JnHtwPxQ7mDBhN
         rargQjwhY0322r80xnVJejBXfn0XS/mh7LcFXWW6hDMYCi8UH2lPumN6OSLtS2RlM6KA
         BBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450909; x=1776055709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXUoLovshS45ImVzQne7VV0jmQ4Q7XifTi93AwcLyVE=;
        b=oYGBplviJh26YPf4BSHEIqH0ZcjaqyP67GI5aEUxm747nM3j5P5QXYLGyL+jjxSDBD
         Z4QIywJDz6xCk+kb2HI1gYy5ab6A06Q92otBxi3RpvwBEJowUQ1xhoEgxnMLOUvv6Zj6
         KBAjSLpoTd2z2lU0n5W4gh9iYGrxglUZ24K5JIyDXckv5Gqc9hPDpCLvpi09Ox6B9/1W
         Ybp91lwlX9ue5GJoJ7smbRUoLGgaTsRgZnIpmXymu4tfdRvOZte+aXKCS/9F82a93TBE
         NWsk3Mk++VlCdjEuUAQy27QqRXb8lisGAxpCHf3EGH7SIVvApCIHLNynmx1/qfXFHlKB
         0oAA==
X-Forwarded-Encrypted: i=1; AJvYcCUoAiiL14BYlmRXoXpuKU7DG/zaWqVVpNExt3sIo+nNYWrOSMPfkV1en5el2c6xVDAOBPd+Q+QDIis+Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsksH/gEaOQ++AlloYhQjQZMF9raMl9M8PVsVYolFlhzNQrY86
	TtSYu9uii7oXws4aq7EkGXhx7moGJKtMyo1OPHM+p12KSu5sOqtUXSTjUrYhgo7H02efFxBYMz6
	aDdTaomBEbkmvaJf8w7iCzTSTo4bwFWD5mWpGTGTkl4TyxieaF7e/o2mWKbjeMrHV+e3COJBG6c
	Z+SObh9NsHfDCdFt/7W0uk7pl+z2LYbLhlh7KTuH5vXiWR4w==
X-Gm-Gg: AeBDiesaGPLi/suap0C041z3VPkFOH1BI/gcSg/GcT4tamgVJE49Q3u9P7AOcVTdLwU
	QbfW5lrTUhzRrqoPJoVYEBZEr6Cpm8VpVjFuB6GmrTAEDiT4vImlg01+iLsbvmzenj30jUFWEm+
	O+b5L8gTo9PTcsmQ4v3/Dm8x4kZ0RO+WWEKvdKJPRvOAfvftKEpLvJzmzWzyLSXTr9cCCSSWkZE
	MDlXvg=
X-Received: by 2002:a05:6808:d4d:b0:466:f25d:3289 with SMTP id 5614622812f47-46ef8219ecamr5901680b6e.36.1775450908765;
        Sun, 05 Apr 2026 21:48:28 -0700 (PDT)
X-Received: by 2002:a05:6808:d4d:b0:466:f25d:3289 with SMTP id
 5614622812f47-46ef8219ecamr5901670b6e.36.1775450908270; Sun, 05 Apr 2026
 21:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com> <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
In-Reply-To: <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 10:18:17 +0530
X-Gm-Features: AQROBzDvlyS_bFZ3lTp0sy7Yqc1vO0-54jaXDGIBFq0XKtXKU_t659Ml5tQC-go
Message-ID: <CA+Ht8=bLxTz8_Cm2s=01CBNpmx4g6XhT6ZzTfJH9rPgDXPOUjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: liangzhen <liangzhen@linux.spacemit.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
        shuah@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MyBTYWx0ZWRfX0qdb22SUXa0W
 MLlThIt/1Gsw/3rUyn8cZVJotm/u00Z/dJ3LzItgek4pY1uwqiReoT961VGHxr5VufQpF1Bxjqe
 DJlzCiwaH9/lpGaL0Q1QEX8fJwBOvoc7ik3yD09iYjcKVjOBwGVncxkTXIMNV6a1e7FezVU27ah
 7ilFH4JDI+DJG19ghm/MjwEk35aqm23D5SQDcGiXh5sGmEVTzcsPzmp5gKy8ZoHeKWtxeSNKAe/
 k5HLiqLYVndBuqSEPeasDkM3dO51BzVXn/j9MGA5RwbdTeAvXSXCDlscyz96TTmdlXiGaM/tMWT
 M5r8iitSfSFisEd6/UzvbNjEfqoWL3aian8oNJcfoQe5OJNHUrxEN6yci0Gih5bKkizv1+VEI7U
 KqkC0pjyYuSd7xosJw4Z3ovEqaSBM+BNAtJ4fevGKvC8N4ST/e9chD7RA7v/yc0lbkKRrC7UcGH
 JqZ0JV7F9N649jgqPfg==
X-Proofpoint-GUID: X42Uwj9vYmwNnHyE0E7e1I8mrrexfn5q
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d33b1d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=lv0vYI88AAAA:8 a=QYqxtYOhi7kfI8OWVzMA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: X42Uwj9vYmwNnHyE0E7e1I8mrrexfn5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_214832_160901_68FB058C 
X-CRM114-Status: GOOD (  17.99  )
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

SGkgTGlhbmd6aGVuLAoKU29ycnkgSSB3YXMgYnVzeSB3aXRoIHB0cmFjZSBpbXBsZW1lbnRhdGlv
biBvbiB0aGlzIHBhdGNoIHNlcmllcy4KV2hpY2ggaXMgZG9uZSBub3cgYW5kIEkgd2lsbCBzZW5k
IGl0IGFmdGVyIHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoaXMKcGF0Y2guCgpPbiBGcmksIEFwciAz
LCAyMDI2IGF0IDE6MDnigK9QTSBsaWFuZ3poZW4gPGxpYW5nemhlbkBsaW51eC5zcGFjZW1pdC5j
b20+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGFuayB5b3UgZm9yIHRoaXMgcGF0Y2gsIEkgaGF2ZSBv
bmUgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBzaXplIGZpZWxk
Ogo+Cj4gT24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMTA6MTk6MTdBTSArMDUzMCwgSGltYW5zaHUg
Q2hhdWhhbiB3cm90ZToKPgo+ID4rICAgIGNhc2UgSFdfQlJFQUtQT0lOVF9MRU5fMToKPiA+KyAg
ICAgICAgaHctPmxlbiA9IDE7Cj4gPisgICAgICAgIGh3LT50ZGF0YTEgPSBSVl9EQlRSX1NFVF9N
QzZfU0laRShody0+dGRhdGExLCAxKTsKPiA+KyAgICAgICAgYnJlYWs7Cj4gPisgICAgY2FzZSBI
V19CUkVBS1BPSU5UX0xFTl8yOgo+ID4rICAgICAgICBody0+bGVuID0gMjsKPiA+KyAgICAgICAg
aHctPnRkYXRhMSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0YTEsIDIpOwo+ID4rICAg
ICAgICBicmVhazsKPiA+KyAgICBjYXNlIEhXX0JSRUFLUE9JTlRfTEVOXzQ6Cj4gPisgICAgICAg
IGh3LT5sZW4gPSA0Owo+ID4rICAgICAgICBody0+dGRhdGExID0gUlZfREJUUl9TRVRfTUM2X1NJ
WkUoaHctPnRkYXRhMSwgMyk7Cj4gPisgICAgICAgIGJyZWFrOwo+ID4rICAgIGNhc2UgSFdfQlJF
QUtQT0lOVF9MRU5fODoKPiA+KyAgICAgICAgaHctPmxlbiA9IDg7Cj4gPisgICAgICAgIGh3LT50
ZGF0YTEgPSBSVl9EQlRSX1NFVF9NQzZfU0laRShody0+dGRhdGExLCA1KTsKPiA+KyAgICAgICAg
YnJlYWs7Cj4KPiBHREIncyBnZGJhcmNoX2JyZWFrcG9pbnRfZnJvbV9wYyBtZXRob2QgcmV0dXJu
cyBsZW49MiBmb3Igbm9uLWFsaWduZWQgYWRkcmVzc2VzLCBjYXVzaW5nIHNpemUgbWlzbWF0Y2gg
d2l0aCBoYXJkd2FyZSB0cmlnZ2Vycy4KPgo+IEEgc2ltcGxlIHRlc3QgaXMgYXMgZm9sbG93czoK
Pgo+IHJvb3RAazM6fiMgY2F0IHRlc3QuYwo+ICNpbmNsdWRlIDxzdGRpby5oPgo+Cj4gaW50IGEg
PSAwOwo+IGludCBtYWluKCkKPiB7Cj4gICAgICAgICBwcmludGYoInN0YXJ0IHRlc3RcbiIpOwo+
ICAgICAgICAgYSA9IDE7Cj4gICAgICAgICBwcmludGYoImEgPSAlZFxuIiwgYSk7Cj4gICAgICAg
ICBwcmludGYoImVuZCB0ZXN0XG4iKTsKPiAgICAgICAgIHJldHVybiAwOwo+IH0KPgo+Cj4gcm9v
dEBrMzp+IyBnY2MgLW1hcmNoPXJ2NjRnYyAtZyB0ZXN0LmMgLW8gdGVzdAo+IHJvb3RAazM6fiMg
Z2RiIHRlc3QKPiAuLi4KPiBzdGFydAo+IC4uLgo+IFRlbXBvcmFyeSBicmVha3BvaW50IDEsIG1h
aW4gKCkgYXQgdGVzdC5jOjYKPiA2ICAgICAgICAgICAgICAgcHJpbnRmKCJzdGFydCB0ZXN0XG4i
KTsKPiAoZ2RiKSB4LzhpICRwYwo+ID0+IDB4MmFhYWFhYTZlYSA8bWFpbis4PjogICAgICAgYXVp
cGMgICBhMCwweDAKPiAgICAweDJhYWFhYWE2ZWUgPG1haW4rMTI+OiAgICAgIGFkZGkgICAgYTAs
YTAsODYKPiAgICAweDJhYWFhYWE2ZjIgPG1haW4rMTY+OiAgICAgIGphbCAgICAgMHgyYWFhYWFh
NWQwIDxwdXRzQHBsdD4KPiAgICAweDJhYWFhYWE2ZjYgPG1haW4rMjA+OiAgICAgIGF1aXBjICAg
YTUsMHgyCj4gICAgMHgyYWFhYWFhNmZhIDxtYWluKzI0PjogICAgICBhZGRpICAgIGE1LGE1LC0x
NzcwCj4gICAgMHgyYWFhYWFhNmZlIDxtYWluKzI4PjogICAgICBsaSAgICAgIGE0LDEKPiAgICAw
eDJhYWFhYWE3MDAgPG1haW4rMzA+OiAgICAgIHN3ICAgICAgYTQsMChhNSkKPiAgICAweDJhYWFh
YWE3MDIgPG1haW4rMzI+OiAgICAgIGF1aXBjICAgYTUsMHgyCj4gKGdkYikgaGJyZWFrICoweDJh
YWFhYWE2ZjIKPiBIYXJkd2FyZSBhc3Npc3RlZCBicmVha3BvaW50IDIgYXQgMHgyYWFhYWFhNmYy
OiBmaWxlIHRlc3QuYywgbGluZSA2Lgo+IChnZGIpIGMKPiBDb250aW51aW5nLgo+IHN0YXJ0IHRl
c3QKPiBhID0gMQo+IGVuZCB0ZXN0Cj4gW0luZmVyaW9yIDEgKHByb2Nlc3MgMTc4NCkgZXhpdGVk
IG5vcm1hbGx5XQo+IChnZGIpCj4KPiByb290QGszOn4jIGdjYyAtbWFyY2g9cnY2NGcgLWcgdGVz
dC5jIC1vIHRlc3QKPiByb290QGszOn4jIGdkYiB0ZXN0Cj4gLi4uCj4gc3RhcnQKPiAuLi4KPiBU
ZW1wb3JhcnkgYnJlYWtwb2ludCAxLCBtYWluICgpIGF0IHRlc3QuYzo2Cj4gNiAgICAgICAgICAg
ICAgIHByaW50Zigic3RhcnQgdGVzdFxuIik7Cj4gKGdkYikgeC84aSAkcGMKPiA9PiAweDJhYWFh
YWE2ZjQgPG1haW4rMTY+OiAgICAgIGF1aXBjICAgYTAsMHgwCj4gICAgMHgyYWFhYWFhNmY4IDxt
YWluKzIwPjogICAgICBhZGRpICAgIGEwLGEwLDEwMAo+ICAgIDB4MmFhYWFhYTZmYyA8bWFpbisy
ND46ICAgICAgamFsICAgICAweDJhYWFhYWE1ZDAgPHB1dHNAcGx0Pgo+ICAgIDB4MmFhYWFhYTcw
MCA8bWFpbisyOD46ICAgICAgYXVpcGMgICBhNSwweDIKPiAgICAweDJhYWFhYWE3MDQgPG1haW4r
MzI+OiAgICAgIGFkZGkgICAgYTUsYTUsLTE3ODAKPiAgICAweDJhYWFhYWE3MDggPG1haW4rMzY+
OiAgICAgIGxpICAgICAgYTQsMQo+ICAgIDB4MmFhYWFhYTcwYyA8bWFpbis0MD46ICAgICAgc3cg
ICAgICBhNCwwKGE1KQo+ICAgIDB4MmFhYWFhYTcxMCA8bWFpbis0ND46ICAgICAgYXVpcGMgICBh
NSwweDIKPiAoZ2RiKSBoYnJlYWsgKjB4MmFhYWFhYTZmYwo+IEhhcmR3YXJlIGFzc2lzdGVkIGJy
ZWFrcG9pbnQgMiBhdCAweDJhYWFhYWE2ZmM6IGZpbGUgdGVzdC5jLCBsaW5lIDYuCj4gKGdkYikg
Ywo+IENvbnRpbnVpbmcuCj4KPiBCcmVha3BvaW50IDIsIDB4MDAwMDAwMmFhYWFhYTZmYyBpbiBt
YWluICgpIGF0IHRlc3QuYzo2Cj4gNiAgICAgICAgICAgICAgIHByaW50Zigic3RhcnQgdGVzdFxu
Iik7Cj4gKGdkYikKPgo+IEFzIGEgcmVzdWx0LCBoYXJkd2FyZSBicmVha3BvaW50cyBzZXQgb24g
MTYtYml0IGluc3RydWN0aW9uIGFkZHJlc3NlcyBtYXkgZmFpbCB0byB0cmlnZ2VyIGR1ZSB0byB0
aGlzIHNpemUgbWlzbWF0Y2guIFNvIGNhbiB3ZSBjb25zaWRlciBzZXR0aW5nIHRoZSBTSVpFIGZp
ZWxkIHRvIDAgKG1hdGNoIGFueSBzaXplKSwgaGFyZHdhcmUgdHJpZ2dlcnMgbWF0Y2ggbWVtb3J5
IGFjY2Vzc2VzIG9mIGFueSBzaXplLgo+CgpJIHRoaW5rIHlvdSBoYXZlIGEgZ29vZCB0ZXN0IGNh
c2UgaGVyZS4gV2UgY2FuIHNldCBzaXplIHRvIDAgaWYKc3BlY2lmaWNhbGx5IGFza2VkIG9yIGlu
IHRoZSBkZWZhdWx0IGNhc2UuCkRvIHlvdSBoYXZlIGEgcGF0Y2ggc2V0IGFnYWluc3QgR0RCIHRv
IHRlc3QgdGhpcyBvdXQ/CgpUaGFua3MKUmVnYXJkcwpIaW1hbnNodQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
