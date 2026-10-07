Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51A3CA6002
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2DRNyuhHZvyTxEjFEHDOoSVg4404tqdXKep6Hhq9P0=; b=ip8Sww328odtjO
	6o/XKHUA0R39b75G+wkHcOmQftHUx39ftj8A6KdpSOJknUQxEAFDIXSF/Ivuny2WZ58ZOsUu5CYhH
	27dKiNeKcmY8baKXlfM/dQNOzkBbJ1Uu988q8lbgnmHmJxzFJx/b/WO/Q2PaaGo4J7L2gZnZXs+XE
	3nbFzYWBi7RGhG+oR2XP1f+U7yMItD2qvTvSX/h68Tv/WWy+/42DQRdSGhd3FsTltrwEPznNUwj7X
	pnR2DVuqHDdiwyq4B050C7F/YxG8x1KYKRoVQ6WWuBSZM2qZw8r2XnfSXD6lJvmNbuNY62pb/Jps9
	E0QccT0kJu9Bi0CB8HJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMYr-00000001uSW-39sk;
	Wed, 07 Oct 2026 07:59:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMYp-00000001uRl-169t
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 07:59:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jkZl152085
	for <linux-riscv@lists.infradead.org>; Wed, 7 Oct 2026 07:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=; b=e2E2frolqzl/c0BS
	TSY0qier8vJNk8Rt5meyziF5+ku3CJfN4QbEtJGKv7TXrv1Aw8C37IR/oWqcPsz2
	lnoFuL0sj5cKQ572R/lnugStrfl8IfhNZyHQ8hR8w5DEoaMoc76hkGKsXATuuWzg
	8TP3IlNAw81u+6MRPSarIuqC2zwR9uBs1T7RuSVZztLuborQSy1YgqDgW8lUp5md
	PSWBZW/uh2Fm4atUGTjMqGQALHxrN9m/7RhqJhlSkkPp1vTqyZfSWG+2NzkhY2YH
	gxPEMl0l09zaK0tzVbjCo2n12P9eGS/biHBfdd3NhfKcUMbVsdC8pSorLjXHTmaZ
	pN5IWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c7195fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 07:59:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53514fbd4a3so82479391cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359973; x=1791964773; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=;
        b=fGgZGjrVnWKikHn+59KXaqnRtBhqC6w6p+NZCKZMMlnKZs5wXcRpZoLaTtpCPeRGEL
         b66YS1oC+Enh/WXsokyp+V0Oxb/rFyJkUkNeIE+lO4YUDrE7lTPzDmC0G37+XGRIYdtr
         LU7szR1CL/5rAs2kP3X1se52kDNVa0ODW2y64DnCvwExHeDr6BLqwTylUi1hNvakEw68
         vBCfWq8zaTWAKjOctlsd9utKpAmM2SjgVQ92D0Glm+z+/YG1T3W0xFvf7OnDID433zD2
         4bvwh2QEL9c2Yzh5jaUPVoUARsMBZgCz924qIRMeNhLxv1MtV41LJKUgVrx1dQEu/Z05
         lC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359973; x=1791964773;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=;
        b=nYNzuEbB/rhWBprR3R9xAtP6hoHosvdotAzIzvP4nIAO3Bfzm8K/OV9uvbH0q+w/BW
         qR7qlNg6j9as+v5s2czAN8xUM5E2GEjDwxxWmVH9/OaLtpfsUbi1vCn/vEZvej30Gkh4
         09C4kp/PM+NaIDlHFM6/kRRJW0BDKwhaBpGRsezlJ4+oENo0n1A84q2ZVUKlqFKNdsdt
         WTeQWg8UIotxfxOK01zuyt3AklrXF1xE96BZ6I2KhAGksn1ZJRvSnC90RLPf6zehO9T9
         Sz4L9WRK0sSFEaxciPdGxkmi+E7yysJvYouram22oJGkSZGQxaqaV6+DHKc8mZibKRq9
         oxJA==
X-Gm-Message-State: AFuF++mp3/PXcFebMmRdayePK4OgcdCRTqRBYe3jrdaHjOzbSPCZj0n+
	LNHP9pd6p99gvSh6reQf1t/kXQTwrbPvJ0VgMWE7xTp43sBFewbKOdCMlbTzo66JF6YSP/rCCzA
	1OuL2NEiRIDGt+RzzoMdKURqw5qdKllGCCzkz07aGJU5a2vG1OrAk2V+ojt+QTaaKiCXsCsE=
X-Gm-Gg: AYBFou2WUL5ppgXGKUpuJqxxSXh3PWnu8INqCKdLqN/WLoajhZMI92636iNqAJ4kp3b
	Q14QyqljML+6ZvRoxmKkq4bVU22yyve6waLG4ZBq9tj5V2tWen1CxcgFdxl7Ofp6tJ1Jnau7Ibm
	JBXhCdk+vGoR9znvq0Xiw7a4bmHt22JrZp/ir3bMLRwJeST02t1jfzqDdb+yhJoLRLvZEoazoCp
	o870cg/A35kcEB1qBM76GfNjH7s2L02OBDIzIQZKPmiyF1iI1PMLeTxW3F45yZD9JJfVVHGADkl
	1Ggpo2jKjDucQzWMr8FCPjGGenemm1r3fPU2MUGS+jPtJFyTU8NXNmPwFHsGE4Xq1NSMQIoQ8hO
	APKaLjOLS+bYINesBvVKfhdnHrDv0oaINg93kYQ==
X-Received: by 2002:a05:622a:5818:b0:535:70b5:80c with SMTP id d75a77b69052e-535755b4ce1mr22904311cf.68.1791359972653;
        Wed, 07 Oct 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:5818:b0:535:70b5:80c with SMTP id d75a77b69052e-535755b4ce1mr22903801cf.68.1791359972093;
        Wed, 07 Oct 2026 00:59:32 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm145831755e9.9.2026.10.07.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:59:31 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 07 Oct 2026 09:59:30 +0200
Message-Id: <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.16486951642128892687.b4-review@b4>
In-Reply-To: <179133089395.137225.16486951642128892687.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX95JvOHwB7Rda
 bCVK6w4gwsYPzKBcgYfx6G5umd7ChrHmkO9ey+QpzH6126qcIpY09WCLyXppXmp6tgJyVsxgLzg
 cxCjUOLnKOWeAOoY8XAM6HM6n1j6nHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX2BTZe/2SxUL0
 XYr9OdK6NjDddt+8YdCmUaChtZGOB4xUaFwTHoQEAdlLjEGWIOtitDBARqrI+ztQkUnbm1Kw9uK
 syRFsTD6/BEjSc5Q/3MUE8UIIPRkvIl+jRylv3wTt1Inpj0GIyNi561ouMQ+qL9agpP6pHQ18Ot
 OYHeDDynLMkKG+diKNDJ0sL/Zv8MCTPijtrXm/r7uuY9uf5pT8Yq1Aexc+jlH872evjRQ44sEpe
 NH25rXE7IVbx1TdhDF2wzZ5LFdTKgvi/Sh37+wXORuvyIboNRc3NrxtVAYhxjMZgHNpFkbC8CoP
 XtXoA/XnVBu8pIvwJPejYItLhUUztzzhuUyNodOAcRyY5fa22K9r3p4z6veqJFFgacIJxB4dpzH
 sji8lvKnZqf2Z/eTxySeGtNUR9byQMvk5iupzcKETcv5s0/QDS6R9aAN2qXIbqLd0eeizbyUqgS
 1rStCMiX5T3rSkLBM/A==
X-Proofpoint-GUID: FFVuCHCCKRuYx49ijeU-Uhu7OfqZz0xA
X-Proofpoint-ORIG-GUID: FFVuCHCCKRuYx49ijeU-Uhu7OfqZz0xA
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5fbe6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=x1oqbuiUUPxTaVOWjaoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_005935_308404_C0F45C0E 
X-CRM114-Status: GOOD (  14.76  )
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

MjAyNi0xMC0wNlQxNjo1NDo1My0wNzowMCwgQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVu
a2luc0BnbWFpbC5jb20+Ogo+PiBVc2VyLW1vZGUgdXNlIG9mIFhUaGVhZFZlY3RvciByZXF1aXJl
cyBub24tT2ZmIHNzdGF0dXMuVlMsIHdoaWNoIHdlIHNldAo+PiBvbmx5IHdoZW4gaGFzX3h0aGVh
ZHZlY3RvcigpIChDT05GSUdfUklTQ1ZfSVNBX1hUSEVBRFZFQ1RPUiBhbmQKPj4gWFRoZWFkVmVj
dG9yIG9uIGFsbCBoYXJ0cykuICBYVGhlYWRWZWN0b3IgYWxzbyBidW5kbGVzIG9wZXJhdGlvbnMg
d2l0aAo+PiBmbG9hdGluZyBzdGF0ZSwgd2hpY2ggYWRkaXRpb25hbGx5IHJlcXVpcmVzIG5vbi1P
ZmYgc3N0YXR1cy5GUyBhbmQgaGVuY2UKPj4gaGFzX2ZwdSgpLiAgaHdwcm9iZSByZXBvcnRzIFhU
aGVhZFZlY3RvciBmcm9tIHRoZSBwZXItaGFydCB2ZW5kb3IgSVNBCj4+IGJpdG1hcHMgYWxvbmUs
IHNvIGl0IGNhbiBhZHZlcnRpc2UgYW4gZXh0ZW5zaW9uIHRoYXQgaXMgYWx3YXlzIGRpc2FibGVk
Cj4+IGluIHVzZXItbW9kZS4KPj4gCj4+IFJlcG9ydCBjb3JyZWN0IGVudmlyb25tZW50IHRvIHVz
ZXItbW9kZS4KPj4gCj4+IEZpeGVzOiBhNWVhNTNkYTY1YzUgKCJyaXNjdjogaHdwcm9iZTogQWRk
IHRoZWFkIHZlbmRvciBleHRlbnNpb24gcHJvYmluZyIpCj4+IFNpZ25lZC1vZmYtYnk6IFJhZGlt
IEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+Cj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMKPj4g
aW5kZXggMmViYTM0MDExNzg2Li5mMDdhYTFjOGFjYWMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYwo+PiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMKPj4gQEAgLTEs
NSArMSw3IEBACj4+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+
ICAKPj4gKyNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rv
ci5oPgo+PiAgI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZC5oPgo+PiAgI2lu
Y2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmg+Cj4+ICAjaW5jbHVk
ZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3ZlbmRvcl9od3Byb2JlLmg+Cj4+IEBAIC0xNCw2ICsx
Niw3IEBAIHZvaWQgaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF90aGVhZF8wKHN0cnVjdCByaXNjdl9o
d3Byb2JlICpwYWlyLCBjb25zdCBzdHJ1Y3QgY3B1Cj4+ICB7Cj4+ICAJVkVORE9SX0VYVEVOU0lP
Tl9TVVBQT1JURUQocGFpciwgY3B1cywKPj4gIAkJCQkgICByaXNjdl9pc2FfdmVuZG9yX2V4dF9s
aXN0X3RoZWFkLnBlcl9oYXJ0X2lzYV9iaXRtYXAsIHsKPj4gLQkJVkVORE9SX0VYVF9LRVkoWFRI
RUFEVkVDVE9SKTsKPj4gKwkJaWYgKGhhc194dGhlYWR2ZWN0b3IoKSAmJiBoYXNfZnB1KCkpCj4K
PiB4dGhlYWR2ZWN0b3IgaXMgYWxzbyBnYXRlZCBvbiBGUFU9eSBzbyB0aGlzIGlzIGEgcmVkdW50
YW50IGFkZGl0aW9uLiBJcwo+IGl0IHdvcnRod2hpbGUgdG8gbWFrZSB0aGlzIGNoYW5nZT8KCldp
dGggQ09ORklHX0ZQVT15LCBoYXNfZnB1KCkgaXMgc2V0IHRvIGZhbHNlIHdoZW4gYSBzaW5nbGUg
aGFydCBkb2Vzbid0CmhhdmUgdGhlIEQsIGFuZCBoYXNfeHRoZWFkdmVjdG9yKCkgY291bGQgc3Rp
bGwgYmUgdHJ1ZS4KCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSXMKPiBpdCB3b3J0aHdoaWxlIHRvIG1ha2UgdGhp
cyBjaGFuZ2U/CgpJIHRoaW5rIHRoYXQgaXQncyBzZW5zaWJsZSB0byBtaW1pYyB0aGUgdmFsaWRh
dGlvbiB3ZSBkbyBmb3IgdGhlCm5vbi12ZW5kb3IgZXh0ZW5zaW9uLCBidXQgdXNlcnMgb2YgdmVu
ZG9yIGV4dGVuc2lvbnMgbGlrZWx5IGFscmVhZHkgaGF2ZQp0byBnbyBvdXQgb2YgdGhlaXIgd2F5
IHRvIHV0aWxpemUgdGhlbSwgc28gdGhleSBjYW4gZG8gdGhlIHNhbml0eSBjaGVja3MKdG9vLi4u
IEkgY2FuIGRyb3AgdGhlIGxhc3QgdHdvIHBhdGNoZXMgaW4gdjIuCgpUaGFua3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
