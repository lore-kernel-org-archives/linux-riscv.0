Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08CFF5108
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C98f3/pshNCDi/cUEjsJivmWnozSIfo0JWFzffTRJTE=; b=Khd8tE3hC6G6gY
	UfVf+YqehbNml63aVEeQuw4hG/13I6dXCK8BDngr8GEZidwhqsRB1bFSbkvdXHjTFOwaKuHFAt9L6
	pqz3BtHS1QOD/oS3SIe1mj1dXorDOF+kPP1APcor8uDaTkC1jGbJTLCn0EFvTyaY89s+gYzuPOpBK
	TdO7O0QhNHaQbrFY5xTjhYT3IVuhqOl3Vi1wXaso3tCFL1bSmPQ8GAEwmEa5uMFeYMBgIQciXfsK4
	MZRhxtk5X/tonEUM1bUlPffvGMmlyA/lk2Y2j0nbyMCPwqXItjR/Ekz30tsLY7r+VOFSuzMjGE3rA
	8e7WVVWJAJsBOncQFV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8NB-00000006hmT-0IFA;
	Tue, 07 Apr 2026 15:29:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8N7-00000006hl9-1YBW
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:29:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CTGIg2580245
	for <linux-riscv@lists.infradead.org>; Tue, 7 Apr 2026 15:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myYML4z72wQ2q0hV1iRX5KlCq8McN5Mv9jZ1cSnXiu4=; b=IwBXmPmXFA95FGab
	u6z2i28e7VIgWamO+ny8HCkQYQfZj7FO3tmkQ+zuK0SqMwMbp3CVNmqUaRF1ogQY
	pOb1LAfs2NWOWe4B/Hx2sOvWAy6JC+rMALuAppNi6Wmlttb/Whgw8NpjNqL+cwX9
	7XJvxf84bzbVMFg2XhBhQ3Wn0mzKJ9dSbQeflxIpBwGiAjBqrTAUsD76GmeDcP4D
	sl0828j3OVEualW++x0MSb0osEt5OEMDzvFrAzestCQ0hnFewkxMCDwr9dKpRaUc
	znSzSFGCthaVh5elSMJX+qF/Ef8+rapNQQxg75djUYk6LwfL43HU+ECGL29VudCj
	2l3+tA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf3d67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 15:29:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46fab90a5e2so940855b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 08:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775575783; cv=none;
        d=google.com; s=arc-20240605;
        b=NKeH5MyiifBmS4yzH95H61L1gWo7j0LFkayT+ZeLTz6jDFXkGomZQBOOdJoR9etvXO
         6Dq4cb0ZGaCNV3Z27Vu7BdUuEz3UWG9Se6LP02CTM9eM0JL0GDDX6ReItqz+UvpNg/0t
         ItFnjRODDt5wmYifWxSTGXByVfy0m4UlK+MUpWn9/Ym75lUXaR3E9mKaIFKKEf8QgVGX
         BoeWusOHSFuLwPGN8EPW/nI6ncfSa5JQ49CNA1+o35efnInvmOPpdmtlQSFIiS8yrCBQ
         YqM67zikFWcAfabxN+1ltAzFyhA7L4ohX0ElR0xw+3VX4MOYPu4+LGh+QpEYKM5TUbj6
         dbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myYML4z72wQ2q0hV1iRX5KlCq8McN5Mv9jZ1cSnXiu4=;
        fh=/J7HXTLg2u8MEblAh4+uSZIqbb1FY0q+eH7PIXzOS/U=;
        b=XHXflCP91Wf5dmjvdDjoTH2XUqNkkt2agYRGaAqPgaAjIEet3KF5ZmzvpTIeNdkmvk
         UM1p9r0xUOLL3I4SBEQqicnuKIDGvTTUi+rpUo+1fcOCvwXoVi6NfTxLUQrW4+ro3+Gk
         k+4jg5ZYbAFvwdr5R9CmcI2OXFmXqMiWnHzZs84UOfXXgBCf87QbCNaRRU+v33A3StD3
         J0Wv5UABtSFfHkuu/PAPINan7weYvzyJ3djgYw5ZNq4ALpd5or65/L9oMNt/q3UCIRF9
         ANw5/ESWcI2mw1OXzGCtRf27/n103MP4YHaHpKNXC4SI6KH8/DzSAVk/P+1Mp8hbm9G8
         FzDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775575783; x=1776180583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myYML4z72wQ2q0hV1iRX5KlCq8McN5Mv9jZ1cSnXiu4=;
        b=LQLAYn7kJV8Pb+TvdLZKq3F5QSE0Yl61javMf3rpzSGZW5G7E1pPH+xh2NizxoQRVS
         JQhpQRVaGGgMcTrvAv8LNr0hj9t8CBAjr+YM/xkoP4B806vb8AG2xI72OxRIBLUfiasH
         FZcRm/kuA6/eSKyN/Vk9RMJGCXWL14bC4sxg8JKgpXIJcWh6+X3FUkH8/OKdbY7+6Ee0
         hJFGys0ibf2EnviDOnHwPk1t3t7NUTq//fPOZSnWUSffYovEb6mGgoAAaZ5NleVEDoro
         /Jxi0snHER4j5vdtA01HGYyO5kSeIJtdBFXokC/BNwTysI/IwDfa6clPBNXN4yCrlszY
         7GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575783; x=1776180583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myYML4z72wQ2q0hV1iRX5KlCq8McN5Mv9jZ1cSnXiu4=;
        b=IA0YK9ikanVrstzrh3wDrYlFkjgZm42ISeZI6jn87uYB2GOKyGgzhQT9m9AIEbzCwJ
         N69dRdZtV8KK+i9KGC5SJ2DJ/v2fugiEIf7r4VaeY4IYYdFFbYJJuuTrJc/h+mNwqtXZ
         P2Ewu9PormKtzCxHYrOycMLmSBbAmuD3vCYxaQ9kj41Bb+/vfYos78dwy+rLxKRD12Uf
         FQH08PbcjjpUm2OLE9VOksNqWoxTxvs+ZNNfKFE91+AGqoCqmtwJBU2CtsK92nVRF4KD
         MmIGTbueSQmSyNXi9h7wWp/5XJKNL5CecI9wqjbbXy83DCy1NVIaAmAXAHy1IC7XlpT3
         ezUA==
X-Gm-Message-State: AOJu0YxBClDnN6oEgK+bg8KWBBrvpv2QDJhsya3FZNBCk9fLi8UzycMD
	Y2zrYRb9gjJaphxnxz24JsHhs+nQusQPb8viVDwrZF1Ex5B/4NDEpOPvo4S3weK2ssuFajRkAKK
	m+BP7Vxj5+06xBa3YvS+sKk4hatRnCzMlAas8AbGxi30PqN0Ghv+zunwYJuLScD4UnL98IlX0x+
	SH7QPO4+We0qWfW/BosvjeL3+kohdCC4TWv0oT/AQPGav70g==
X-Gm-Gg: AeBDiet0m1eYiKudIRM1ri1p9TkXy1cZqINYB4cOnPdDtPJWDA9s/Io1oGQGjFK/YJm
	3KFgMPkzf3pHq8V8j1qK1wG1mRIk6av7Hnr9R1r+ZQPTpokR178lP7nubb2Iqvnw4XbkPUT5Beo
	T+LE4wcgNJYotkFbKQtZHKhZOeIUsF+XsMR9uxoNhlKisBKucHkWnknvrLMIRlrQ1Ttbeek3uU1
	KpwF9wx
X-Received: by 2002:a05:6808:f8e:b0:45c:881c:e0c0 with SMTP id 5614622812f47-46ef882f23emr9123553b6e.47.1775575783226;
        Tue, 07 Apr 2026 08:29:43 -0700 (PDT)
X-Received: by 2002:a05:6808:f8e:b0:45c:881c:e0c0 with SMTP id
 5614622812f47-46ef882f23emr9123539b6e.47.1775575782728; Tue, 07 Apr 2026
 08:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260319103629.by3bw3qeev26jvqq@imamay-pc> <CA+Ht8=bdEpQTa_7gu0MD43-=eDm-2AESkEVK4F6VTuOVOkzwMA@mail.gmail.com>
 <20260407113445.oqjvwkdgweqj6xku@imamay-pc>
In-Reply-To: <20260407113445.oqjvwkdgweqj6xku@imamay-pc>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 20:59:30 +0530
X-Gm-Features: AQROBzAm172uNemhC6l77Cvb8LIZCzhf4X6TXpfDZYBiwsUeUOcbTJCKwWIpMZk
Message-ID: <CA+Ht8=YKyANevhuHKv1afb0vcdr-6gYRX3BtQ7aBsn0ytJgFRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Ilya Mamay <mmamayka01@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MSBTYWx0ZWRfX0xIxzg337CqM
 yLUAvZNaLDsF6/L0sJemne7QyH4ZXQuj5zlgND4lWPIddTZgG4cjC2KVloxW+4GtIdCVyImdUlf
 nRM8wWQuuWb1W3TX80sz1f8z/2rnpNLyRr31Dkk8S4YEzf0TF3p1cM180Jt9asyIqfqXOco2xqC
 7acAdosjvvTSi8s6xgZAGtw770yp2OdA/EboIVgEuoRtMlHhzaZ16pDGoveRGdThYMzwU24F4s8
 Harh5fNEPMamdDkpJZ7/tuIegA1m1w8BQpHx4qWkQ/QhbezAQ7TVPwARPWmH/EqejiTlAbFhkn1
 b/6yXA+VC2Wqc+oNjFkI0GdgohzOZ2Rwzv0HLOH82luUDRlqiJ81GAIB2CmCNNvtnnziRhu7Dql
 FM/MetTpF63ZHmEDixv+Qs52uJ49poWKkH5nn8H5E69mBvVTcdSyjVfcHYNwrJyfbvT7ZvRQCda
 2W3/jlFXNidDzCK+25Q==
X-Proofpoint-ORIG-GUID: qVf0navblc__A0OQKthW6Jb8wnEEC1ox
X-Proofpoint-GUID: qVf0navblc__A0OQKthW6Jb8wnEEC1ox
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d522e8 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=BIvQ1k-GTAEP2ypwCYoA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082945_536783_79E618D1 
X-CRM114-Status: GOOD (  47.85  )
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

SGkgSWx5YSwKCk9uIFR1ZSwgQXByIDcsIDIwMjYgYXQgNTowNOKAr1BNIElseWEgTWFtYXkgPG1t
YW1heWthMDFAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEhpbWFuc2h1LAo+Cj4gVGhhbmsgeW91
IGZvciB5b3VyIHJlcGx5IHJlZ2FyZGluZyB0aGUgdGRhdGExLmhpdCBjaGVjay4gSG93ZXZlciwg
dGhlcmUgaXMKPiBhIHNlY29uZCBpc3N1ZSBJIHJhaXNlZCBpbiBteSBwcmV2aW91cyBtZXNzYWdl
IHRoYXQgc2VlbXMgdG8gaGF2ZSBiZWVuCj4gb3Zlcmxvb2tlZC4gSSBhbHNvIHVzZWQgdGhlIHdy
b25nIHRlcm1pbm9sb2d5IGluIG15IHByZXZpb3VzIG1lc3NhZ2UgYW5kIHdvdWxkCj4gbGlrZSB0
byBjbGFyaWZ5IHRoZSBpc3N1ZToKPgo+IEN1cnJlbnRseSwgYXJjaF9pbnN0YWxsX2h3X2JyZWFr
cG9pbnQoKSBjYWxscyBTQklfRVhUX0RCVFJfVFJJR19JTlNUQUxMIG9ubHkKPiB3aGVuIHRoZSBw
ZXJmIGV2ZW50IGlzIGJlaW5nIHNjaGVkdWxlZCBvbiB0aGUgdHJhY2VlLiBJZiB0aGF0IGNhbGwg
ZmFpbHMKPiAoZS5nLiwgYmVjYXVzZSB0aGUgaGFyZHdhcmUgV0FSTCBmaWVsZHMgZG8gbm90IGFj
Y2VwdCB0aGUgcmVxdWVzdGVkCj4gdGRhdGExLXRkYXRhMyB2YWx1ZXMpLCB0aGVyZSBpcyBubyB3
YXkgdG8gbm90aWZ5IHRoZSB0cmFjZXIgb3IgcmVqZWN0IHRoZQo+IGJyZWFrcG9pbnQgZWFybGll
ci4gVGhlIGJyZWFrcG9pbnQgd2lsbCBzaW1wbHkgbmV2ZXIgZmlyZSwgYW5kIHRoZSB0cmFjZXIg
b25seQo+IGRpc2NvdmVycyB0aGlzIGFmdGVyIHRoZSBmYWN0IGJ5IHJlYWRpbmcgdGhlIHBlcmZf
ZXZlbnQgc3RhdGUg4oCTIGJ5IHdoaWNoIHRpbWUKPiB0aGUgdHJhY2VlIG1heSBoYXZlIGFscmVh
ZHkgcGFzc2VkIHRoZSBwb2ludCBvZiBpbnRlcmVzdC4KPgo+IFRoZXJlIGlzIG5vIHdheSBpbiB0
aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlIHRyYWNlciB0byB2ZXJpZnkgdGhhdCB0
aGUKPiBicmVha3BvaW50IGNhbm5vdCBiZSBpbnN0YWxsZWQgYmVjYXVzZSBvZiBXQVJMIGNvbnN0
cmFpbnRzLgo+Cj4gSSB1bmRlcnN0YW5kIHRoYXQgYSBmdWxsIHNvbHV0aW9uIG1pZ2h0IGJlIG5v
bi10cml2aWFsLiBIb3dldmVyLCBjb3VsZCB5b3UKPiBhdCBsZWFzdCBzaGFyZSB5b3VyIHRob3Vn
aHRzIG9uIGhvdyB0aGlzIGNvdWxkIGJlIGFkZHJlc3NlZD8KPgoKWW91IGhhdmUgYSB2YWxpZCBw
b2ludCBoZXJlLiBCdXQgYnkgZGVzaWduIHRoZSBhcmNoX2luc3RhbGwvdW5pbnN0YWxscwphcmUg
Y2FsbGVkIGFzIGFuZCB3aGVuIGV2ZW50cyBhcmUgc2NoZWR1bGVkIGJhc2VkIG9uIHNjaGVkdWxp
bmcgb2YgdGhlCnRyYWNlZS4gSSBiZWxpZXZlIHRoaXMgcHJvYmxlbSBzaG91bGQgYmUgd2l0aCBh
bGwgYXJjaGl0ZWN0dXJlcyB3aGVyZQpzZXR0aW5nIGJyZWFraW5nIGlzIG5vdCBhcyBzaW1wbGUg
YXMgYSByZWdpc3RlciB3cml0ZSAoSSBhbSB0aGlua2luZwp4ODYgaGVyZSkuIEFzIG9mIG5vdywg
SSBkb24ndCBoYXZlIGEgc29sdXRpb24gZm9yIGl0LiBCdXQgSSB3aWxsIHRoaW5rCmFib3V0IGl0
IHVubGVzcyB5b3UgaGF2ZSBzb21ldGhpbmcgb24gdG9wIG9mIHlvdXIgaGVhZC4KClJlZ2FyZHMK
SGltYW5zaHUKCj4gUmVnYXJkcywKPiBJbHlhCj4KPiBPbiBNb24sIEFwciAwNiwgMjAyNiBhdCAx
MDoxOTozMEFNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gSGkgSWx5YSwKPiA+
Cj4gPiBPbiBUaHUsIE1hciAxOSwgMjAyNiBhdCA0OjA24oCvUE0gSWx5YSBNYW1heSA8bW1hbWF5
a2EwMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSwgSGltYW5zaHUKPiA+ID4KPiA+
ID4gSSBoYXZlIGJlZW4gdXNpbmcgeW91ciBwcmV2aW91cyBIQlAgaW1wbGVtZW50YXRpb24gZm9y
IHNvbWUgdGltZSBhbmQgaGF2ZQo+ID4gPiBlbmNvdW50ZXJlZCBzb21lIG9mIGl0cyBzaG9ydGNv
bWluZ3MsIHdoaWNoIHRoaXMgaW1wbGVtZW50YXRpb24gaGFzIGFsc28KPiA+ID4gaW5oZXJpdGVk
Lgo+ID4gPgo+ID4gPiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAxMDoxOToxN0FNICswNTMwLCBI
aW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiBIVyBCcmVha3Bv
aW50L3dhdGNocG9pbnQgaGFuZGxlcgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArc3RhdGljIGludCBo
d19icmVha3BvaW50X2hhbmRsZXIoc3RydWN0IGRpZV9hcmdzICphcmdzKQo+ID4gPiA+ICt7Cj4g
PiA+ID4gKyAgICAgaW50IHJldCA9IE5PVElGWV9ET05FOwo+ID4gPiA+ICsgICAgIHN0cnVjdCBh
cmNoX2h3X2JyZWFrcG9pbnQgKmJwOwo+ID4gPiA+ICsgICAgIHN0cnVjdCBwZXJmX2V2ZW50ICpl
dmVudDsKPiA+ID4gPiArICAgICBpbnQgaTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgZm9yIChp
ID0gMDsgaSA8IGRidHJfdG90YWxfbnVtOyBpKyspIHsKPiA+ID4gPiArICAgICAgICAgICAgIGV2
ZW50ID0gdGhpc19jcHVfcmVhZChwY3B1X2h3X2JwX2V2ZW50c1tpXSk7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICBpZiAoIWV2ZW50KQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICBicCA9IGNvdW50ZXJfYXJjaF9icChl
dmVudCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICBzd2l0Y2ggKGJwLT50eXBlKSB7Cj4gPiA+ID4g
KyAgICAgICAgICAgICAvKiBCcmVha3BvaW50ICovCj4gPiA+ID4gKyAgICAgICAgICAgICBjYXNl
IFJWX0RCVFJfQlA6Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChicC0+YWRkcmVz
cyA9PSBhcmdzLT5yZWdzLT5lcGMpIHsKPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwZXJmX2JwX2V2ZW50KGV2ZW50LCBhcmdzLT5yZWdzKTsKPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBOT1RJRllfU1RPUDsKPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAvKiBXYXRjaHBvaW50ICovCj4gPiA+ID4g
KyAgICAgICAgICAgICBjYXNlIFJWX0RCVFJfV1A6Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGlmIChicC0+YWRkcmVzcyA9PSBjc3JfcmVhZChDU1JfU1RWQUwpKSB7Cj4gPiA+Cj4gPiA+
IFNkdHJpZyBzcGVjICg1LjcuMTEgYW5kIDUuNy4xMiBpbiB0aGUgdGRhdGExLnNlbGVjdCBmaWVs
ZCBkZXNjcmlwdGlvbikgc3RhdGVzIHRoYXQ6Cj4gPiA+ICJUaGVyZSBpcyBhdCBsZWFzdCAoISkg
b25lIGNvbXBhcmUgdmFsdWUgYW5kIGl0IGNvbnRhaW5zIHRoZSBsb3dlc3QgdmlydHVhbAo+ID4g
PiBhZGRyZXNzIG9mIHRoZSBhY2Nlc3MuIEluIGFkZGl0aW9uLCBpdCBpcyByZWNvbW1lbmRlZCB0
aGF0IHRoZXJlIGFyZSBhZGRpdGlvbmFsCj4gPiA+IGNvbXBhcmUgdmFsdWVzIGZvciB0aGUgb3Ro
ZXIgYWNjZXNzZWQgdmlydHVhbCBhZGRyZXNzZXMgbWF0Y2guIChFLmcuIG9uIGEgMzItYml0Cj4g
PiA+IHJlYWQgZnJvbSAweDQwMDAsIHRoZSBsb3dlc3QgYWRkcmVzcyBpcyAweDQwMDAgYW5kIHRo
ZSBvdGhlciBhZGRyZXNzZXMgYXJlCj4gPiA+IDB4NDAwMSwgMHg0MDAyLCBhbmQgMHg0MDAzIi4K
PiA+ID4KPiA+ID4gQSAzMi1iaXQgcmVhZCBmcm9tIDB4NDAwMCB3aWxsIGRlZmluaXRlbHkgaGF2
ZSBjb21wYXJlIHZhbHVlIDB4NDAwMCAodGhlIGxvd2VzdAo+ID4gPiB2aXJ0dWFsIGFkZHJlc3Mp
LCBidXQgbWF5IGFsc28gaGF2ZSBjb21wYXJlIHZhbHVlcyBhdCAweDQwMDEsIDB4NDAwMiwgYW5k
IDB4NDAwMy4KPiA+ID4gVGhpcyBtZWFucyB0aGF0IGEgMTYtYml0IHdhdGNocG9pbnQgYXQgMHg0
MDAyIHdpbGwgZmlyZSBvbiB0aGlzIDMyLWJpdCByZWFkLCB5ZXQKPiA+ID4gc3R2YWwgd2lsbCBi
ZSAweDQwMDAsIGFuZCB0aGUgY3VycmVudCBod19icmVha3BvaW50X2hhbmRsZXIgaW1wbGVtZW50
YXRpb24gd2lsbAo+ID4gPiBub3QgZGV0ZWN0IGl0Lgo+ID4gPgo+ID4gPiBUaGVyZWZvcmUsIGl0
IGlzIGltcG9ydGFudCB0byBjaGVjayB0ZGF0YTEuaGl0IGJpdCAod2hpY2ggaW5kaWNhdGVzIHRo
YXQgdGhlCj4gPiA+IHRyaWdnZXIgY29uZGl0aW9uIHdhcyBkZWZpbml0ZWx5IG1ldCkgYW5kIG9u
bHkgdXNlIHRoZSBjb21wYXJpc29uIGJldHdlZW4KPiA+ID4gYnAtPmFkZHJlc3MgYW5kIENTUl9T
VFZBTCBhcyBhIGZhbGxiYWNrIChpZiB0ZGF0YTEuaGl0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhl
Cj4gPiA+IGhhcmR3YXJlKS4KPiA+ID4KPiA+IFlvdSBhcmUgcmlnaHQuIEkgd2lsbCBhZGQgdGhp
cyBpbiBteSBuZXh0IHJldmlzaW9uLgo+ID4KPiA+IFRoYW5rcyAmIFJlZ2FyZHMKPiA+IEhpbWFu
c2h1Cj4gPgo+ID4gPiA+ICsvKiBhdG9taWM6IGNvdW50ZXItPmN0eC0+bG9jayBpcyBoZWxkICov
Cj4gPiA+ID4gK2ludCBhcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludChzdHJ1Y3QgcGVyZl9ldmVu
dCAqZXZlbnQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBzdHJ1Y3QgYXJjaF9od19icmVha3Bv
aW50ICpicCA9IGNvdW50ZXJfYXJjaF9icChldmVudCk7Cj4gPiA+ID4gKyAgICAgdW5pb24gc2Jp
X2RidHJfc2htZW1fZW50cnkgKnNobWVtID0gdGhpc19jcHVfcHRyKHNiaV9kYnRyX3NobWVtKTsK
PiA+ID4gPiArICAgICBzdHJ1Y3Qgc2JpX2RidHJfZGF0YV9tc2cgKnhtaXQ7Cj4gPiA+ID4gKyAg
ICAgc3RydWN0IHNiaV9kYnRyX2lkX21zZyAqcmVjdjsKPiA+ID4gPiArICAgICBzdHJ1Y3QgcGVy
Zl9ldmVudCAqKnNsb3Q7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBpZHg7Cj4gPiA+ID4g
KyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiA+ID4gKyAgICAgaW50IGVyciA9IDA7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSh0aGlzX2NwdV9wdHIoJmVj
YWxsX2xvY2spLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAqdGhpc19jcHVf
cHRyKCZlY2FsbF9sb2NrX2ZsYWdzKSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHhtaXQgPSAm
c2htZW0tPmRhdGE7Cj4gPiA+ID4gKyAgICAgcmVjdiA9ICZzaG1lbS0+aWQ7Cj4gPiA+ID4gKyAg
ICAgeG1pdC0+dGRhdGExID0gY3B1X3RvX2xlKGJwLT50ZGF0YTEpOwo+ID4gPiA+ICsgICAgIHht
aXQtPnRkYXRhMiA9IGNwdV90b19sZShicC0+dGRhdGEyKTsKPiA+ID4gPiArICAgICB4bWl0LT50
ZGF0YTMgPSBjcHVfdG9fbGUoYnAtPnRkYXRhMyk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJl
dCA9IHNiaV9lY2FsbChTQklfRVhUX0RCVFIsIFNCSV9FWFRfREJUUl9UUklHX0lOU1RBTEwsCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIDEsIDAsIDAsIDAsIDAsIDApOwo+ID4gPgo+ID4g
PiBwZXJmIGluc3RhbGxzIGJyZWFrcG9pbnRzICh2aWEgdGhlIGNhbGwgY2hhaW4gcG11LmFkZC0+
YXJjaF9pbnN0YWxsX2h3X2JyZWFrcG9pbnQpCj4gPiA+IGR1cmluZyBjb250ZXh0IHJvdGF0aW9u
IGFmdGVyIGEgcGVyZl9ldmVudF9vcGVuIG9yIHB0cmFjZSBjYWxsIGZpbmlzaGVzLgo+ID4gPiBT
bywgaWYgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgdGhlIGdpdmVuIHRkYXRhMSwgdGRh
dGEyIGFuZCB0ZGF0YTMKPiA+ID4gY29uZmlndXJhdGlvbiBhbmQgT3BlblNCSSBmYWlscyB0byBz
ZXQgdXAgdGhlIHRyaWdnZXIsIHRoZSBrZXJuZWwgd2lsbCBzdGlsbAo+ID4gPiByZXBvcnQgdGhh
dCB0aGUgYnJlYWtwb2ludCB3YXMgc3VjY2Vzc2Z1bGx5IGluc3RhbGxlZC4KPiA+ID4KPiA+ID4g
QSBwcm9iaW5nIHN0YWdlIGlzIHRoZXJlZm9yZSBuZWVkZWQgIGJlZm9yZSBvciBkdXJpbmcgcGVy
ZiBldmVudAo+ID4gPiByZWdpc3RyYXRpb24gdG8gZW5zdXJlIHRoYXQgYWxsIGJyZWFrcG9pbnRz
IGNhbiBiZSBpbnN0YWxsZWQKPiA+ID4gc3VjY2Vzc2Z1bGx5IGR1cmluZyBjb250ZXh0IHJvdGF0
aW9uLgo+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+ID4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
