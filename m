Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE19CA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s51/oc4fTd7kxkb8LojLxrA4/nRVcmi4oUM57c3afcA=; b=l0oNAEFJ0EbTkg
	GnL0GRW9BgpKWgpBW9Cx7NOh13rrLXjmzh0PJX22GW3K7PQPrWxLVS8lp3jKgoSmbd4R3+90f1gA6
	F/ZuGEMgMhVDn9PXma2Hhn93asETGCA2L5Zn76y/1LXnOlHbm+R40mWMNomY4Td4S7zk25HDY3jcq
	eMCAEMdC5q3ax11zF8Q34un7bF9K4tiZmQAIvu6Y5PyTZiyRr6qqNWDjN2UynWbvz6rGH0aXTyMhd
	IE1diWpne7tWCkEalQCEZ440EsBC+5mmLpsiqf/0Wyb7EUtNRq33Z9DOVW0uK7tHJayYpWKyWahNL
	OX74RLhhSd/aplFEi2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwye-00000006gBg-0zdL;
	Wed, 30 Sep 2026 16:16:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwyX-00000006gB6-3ti7
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 16:16:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxsD92404710
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=; b=Lp3EDzfmeHS8hX6t
	GNf6b1v3nhcN287t091qE6K9bjMVmKlepLB4LFKiT3yi6Og1majvzxOvHBh4uOtn
	tna3Y86n3MmjRD+fdqPQ3Xck1tpo2x6/9KCm9XzbZRo4KEz5bF9ux3ebPQhD1nE/
	iEIG2a1asVlBz6SpFz3qr+DVhxe5Q2pzRtas0HgwCVWt5wVXI20NfvvpsVik0rvE
	HDZTbF7UHahM2r3XQoLB6xFI10QdtgpslIbq76JB+uxXaOOWVmNH7V+PrigG6B0S
	Bjd4KQEuRTWcTuJnK29KdZcKilTa6UgEqHZYdWGdsKq1EQ9DMDFAtf0fEdOqPv1T
	PVmFlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2aem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:16:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so53099915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 09:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784968; cv=none;
        d=google.com; s=arc-20260327;
        b=IxkmyHg8uspmkCTA7DtYgN/W/d0Sbmx+ckJEFQ/4vyV1cDWnO15IoHDtNlxGtZGSIn
         kxlyvWGHzF0Xv7XIQqqLVABiG/ino2l3wg40ilr194fLFweR60Y7luB5RmTXUTkEKOv2
         c7pZxW7G5T/nDZSP5pmEfi8AdK2d/A31qrWZpVL0gL31NXupRzSOfeQkUgp3IsCCCTJv
         TXE8InNsvCfSkmMLdEnvml+CjoazTxNQummDzVFVLrIOYVqoIol9MmECeFq3p0SbmPNQ
         /BLy9fBomDjIndpzoz1TXsLWGMQhL5tHVNC3UPYXPeBX36FAtsbD0O/0y4JH/tbcZABz
         vxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        fh=XJ3nRf7X2yjBDPtMgoUXqUs9CLjMzVBQH0mBSSZ9EbA=;
        b=NMB2d5uGzSnknLMxIYm2T4m2Y0j+xVXvZ2z16oCVhfs1CQSmhlndS8vST+U4XjPmeh
         S/TmyvLEr81msK98r8POvdbgbGwGIwXZ/DxuvzAGG2mPTllz7+HNvBRaLBCHFd/kOVTQ
         lma1goVB2sd3f5O1JThN1H+YihF7jvqnwtKFqIdmunrmwh/nY5ODp+o3gxrVmxhnjsJQ
         QPXXUvqGk0kWe2WzCMsv6RCvNzgUmjQVO4sVdCcuPbO8j6x14YNaOtOB2hCJ2/BTEJin
         kC1bOLa+ZoQP+lqS/zRqqc18Oi3vGx+pCrKguuQ4jt/Glge94wOvRkUA/zKSCDtpTKLZ
         fUuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784968; x=1791389768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=EmQVG83TGJ62n9MF2oaxzO2ZDNkeAqElPHHQCRb4t02OjWjC2SXCLljI79wYZ1HDU9
         2BKBVT/YZ3A1Wj6EpXbkNijt7ZQ+WH3U7uE6jssUUoxZLSnS/NNZPa2bLEOP3OetX9m6
         NEUmDr3SjhYfwltjVHCA/kiUExvOvg+9GeCpb99ZcCS5Z2T84JLLt0IPq+u8TewGymz1
         A33odyis7nDZkiQDhqX2nobWye+M4ErAhw2yh0nd8B3WfmQsMX/y5syN6u27yLWjmqhM
         KhSDV2peUe6V89xdkxMM0QNf9dEWVRK2CrlNTEq2SCQD55jI/nhEDRJwSuPKD1h63Pfr
         BLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784968; x=1791389768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=1Z2n6CXoCWDuXxyxW1Hl7K9NCIwB8PqyJwnq59Qfxm+yGzWq5sINX0lObmvEwmUETg
         fvHjC4G64g5RzHrBgHXyis41hDSx49ZQDeMqM72z93DwI3S93ADVVNi4Bn3zdpMxaEfC
         rwztXUqzA58boNeXXKplrUfH4X/nNVtoacbmsK7gt7r1egZD9J8FYgJFH/AakwHW8Pkr
         teY6zQ3rYGJb9gXhhg69i6y3uG7bPc/+s6tSpbNlGCSwuWfJj1R1GjdH1UWG1AgcmQ4d
         vjVnrARJjOr/zbADYPUaEoxwpKtr37gP0SsSRmqAxcsiXwz44DAymvRVl03Xf4mzPqyB
         NeJA==
X-Forwarded-Encrypted: i=1; AKwUvBwSHKkYg+RgqjJINlNl9uXqC9bgQjsvpSPVxZEKtvrMG4CUx3cCs+yvpfFPEUCFIlWYlkNKfPkzl4ZZXw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLI26ygYZFErGB2sodulVJFSEKZ+YZMYAqevXeaFWG7N7yzUreC
	8Um3L8orguMcTQTI7OE0QkS1NGKonHZzz3BkVCV16sRuPl0yaS2udSnY7mLeWuHAvyCXe5WLCrg
	IDgs5EIa2GiEXIU28LmSzaRieXhK5Hb6NwmahS3s8lC04HR1f8DUssUMvpBhBCzxYfGRPy12qZp
	qoduOXGzg1kw8BgUovADBzl4gRLYV3gUYnCg1iwSKEhqd00g==
X-Gm-Gg: AYBFou3rpLMpH9eENbFBS+Qau0Trp5TzrpT3T70ZDUfVzIYTSOXJxXg0ynj2sPjq+Hb
	adnaSehhQNfDwdQpbHxUP0BV4obxvbi9lV46LHd3vwrmciOqy1QpN1xgKX9iwqqPoM5J9kyjr+a
	BvILUQ1ae/JehXbl587peUG4RdvFfSXCFccCxEAGaTE9tTs4RqDB6ORmyGo4rj4XEluCgf7za6G
	P0jVhWCPRFN6+2GPg==
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e2e4bba080mr12555985ad.55.1790784967928;
        Wed, 30 Sep 2026 09:16:07 -0700 (PDT)
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id
 d9443c01a7336-2e2e4bba080mr12555795ad.55.1790784967454; Wed, 30 Sep 2026
 09:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com> <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
In-Reply-To: <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:45:55 +0530
X-Gm-Features: AclHuK_5_kyqVL5WkfqdmvErnuGjAMAb_FhsM3KGsPnLyHRAuY03VjFVEgGyo2g
Message-ID: <CAHuiULCAAz=HUR6Wog8Avrpd_nikMme+dRgoMWCgZGYCkx31Wg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a
 component path
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
        andrew.jones@oss.qualcomm.com, anup.patel@oss.qualcomm.com,
        anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        irogers@google.com, jolsa@kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        mark.rutland@arm.com, mchitale@gmail.com, mingo@redhat.com,
        namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
        pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6oSoZ7HnUhLq
 C40YHvduwRL28kER1HfMw9ZvwKiS89w6yNdYCljrdrhUraKPWOc9ZQ37+Woux3txzKwYyc/DyKS
 B6ToJSHngQosCzAHU2NZkN2/fMa1ZPc=
X-Proofpoint-ORIG-GUID: yUo73Txyk0sVXiD0LYJdLyOT0yxcgWvK
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd35c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=lv0vYI88AAAA:8 a=510OZKsArkfa_Uw3Rd8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: yUo73Txyk0sVXiD0LYJdLyOT0yxcgWvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX36YMXwAZs/rP
 S1ZOLvglHshAoNU08vvnTzbh5ESrEtt32iJBBkN2KAwdm3+5F6BoCRS8gD12UKa/2qhLxF50sRf
 p98gUSqT6/6r/JBiqP/I66USKMwsuCsK07+YtEizj4Gew0ls4Scc4aoO3k8tbcQNoEsaNcgCYIZ
 uZQce9CEs6JXrIlmHKyf5CwWRIegCeLLJ/MK+d4s/lzcdbS63/XDJi+H/Rc3DRh9rL4NmRSM5w8
 ksPaVcaRhqoFYATL7wggnH4uBAogCxdoCXBiQm18uECtAV319jxg30QdypVKyRTC9pkV1N5XBqy
 s2Q8SzVO3x7yXROcosC0p+OZUTzm3Rs+sDlDIZdlUp3zg15G/JjmxVBx+Qp+dHZ7L0ktvvDcDR3
 IhkMe8DYMINLGJRWbqM6h4A6JqWyZKwcax/2j8abyfEnBRdshf0VROpKxHZATgCQ9yGa63cLdyI
 88tEOcJmWHWj8ZwSrHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_091609_975008_63D297CC 
X-CRM114-Status: GOOD (  12.78  )
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

SGkgWmFuZSwKCk9uIFRodSwgU2VwIDEwLCAyMDI2IGF0IDI6NDfigK9QTSBaYW5lIExldW5nIDxs
aWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gSXQgc2VlbXMg
dGhhdCB0aGUgc2NlbmFyaW8gd2hlcmUgbXVsdGlwbGUgcGF0aHMgY3VycmVudGx5IHVzaW5nIHRo
ZSBzYW1lIGNvbXBvbmVudAo+Cj4gaGFzIG5vdCBiZWVuIHRha2VuIGludG8gYWNjb3VudCBoZXJl
Lgo+ClRoaXMgd2lsbCBiZSBhZGRyZXNzZWQgaW4gdjYuCj4gUmVnYXJkcywKPgo+IFphbmUKPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
