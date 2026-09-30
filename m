Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51E6CA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3eQcRbXonx3LHLMx4f5sL7ssca1JYMNYHxiLSzXz0Q=; b=HH1Ts9VCePLqGK
	L3xMlMSBqk9ui36eYChg5NBloItGCpijMNXEM/U9wbQ9MvHDbS2y4757spcYGaqLqBXQ4WevJR58J
	Ts7Nf/7qWq+wiu1B8hA4MeTRQczH76qX+c+5wVtTbQlp3x78QR2l+r1MMdHYq348wg9CV45yIADX8
	aS27Z07Ni+bcH8+kuwWWkDghVtkdXTfcVJ/GVg6J9k7JrvP1Z8mAQBTtqmYAg2g7R1UCkL+5jwHce
	e9eTon5IHubyehK46tfgRL2gWrq0KRjbdAKaYKBekTFbxlb3Yfc2T8THmtt5ZS0nMGBaE/oVIl7X6
	Gn1RWq3zkifmedm7Q/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxA3-00000006hZL-1aTy;
	Wed, 30 Sep 2026 16:28:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxA0-00000006hYe-3m1R
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 16:28:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxlOK612262
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=; b=Q5x2+As4kHBZ7dwO
	+HybY0XrEa6O0+ssDVL2VtMd61gjDHN1TWV0nNgh1AGgETQz5anl6iAFGgjFrdBV
	FSKgIWGTuttG1RWWlOYFmiJhaSDCzyA3r85ZgAmOPuyWa0GzUNRb2U78Gz6EgWkq
	p839gJd8tGRUmM++QNZK+5MXRdKxQVqNrKQxNzhrDiEKX6LXcyyizPlbyTnmgM/I
	bcRfpy6+5yqMmm6a2+Px/8RQ31UUJRrgtTPGJmFedPt5rpPBJW1AbWMc12khzuuW
	z8O5GitKuuyQwHFcrZtlBWAa4sDtjOqu8KQPA560zF8OhgbckVonyllc1R8zV38D
	92wTRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81vsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:28:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so53066725ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 09:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785680; cv=none;
        d=google.com; s=arc-20260327;
        b=dgjkQ/4gul7qi1EKjnD7xS9UiTA/aaZw/ngW/e78WTe2ieBIgvr9OGW1QPYFspNh67
         Mop3kBLUYn8N8IPoR3QnQD9RiqMZroqeGoBALTAOZZ3QvnfZ/QPcl+furzTtehObD6Gl
         h3DjpqM3qurxKQpNPH/xX9062bMFgNzM5H92p/qoP7POZGSv/dLbq8w/W+yEqZF++ES7
         TlHnd0bWtxxr3T4fZiPNn2C3c5fLQ/DG0USjlsxAex3YSudsv1/Mb3EEXphV7qA2h4dn
         e37pSfHl4zSF97NxWd8xzIHnhEV5bSzXPO7F/GTSGdY7cVetRWklgccOC85IDDrnPtMr
         mJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        fh=/VCqArougc8DQ/V4f6VIeB+V7gSW++oPezr1zzs1tzc=;
        b=d0TjLX/w4jQUAUVaanR2/R2r/IwL5IKNHoR0JnBfOH7VFGskyKVuCQxJPXqu7cgBGw
         Nc/Bb1UyqtygIJvI1wttJjSsGNEl+epuZaIEJWF84aq9X6swNFXi6OEEcODcRuRQqC0H
         DufM2xv3k3Vhn5A6PHTtrDxf+IZ3tDY08ZGJQKQsp5CtZUZKNupjAAFIVyqPoTn/sCF0
         lvSOa1QroTygy64BqIM3Q/nFmBM/1StDwOpleXX4KCFPvtYtW/xVUDt5qyaNRYrV1pGS
         ecnCZOYzHIeM4sII4vAUrVSqwHg2CvPDqVCTDqVP4rfiE2gg1GIl5u+lBoDiZzEQPpWO
         oL1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790785680; x=1791390480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=fsmbYXj7lEu2eNotZVOcJz+TYhAUc0p+ou4/MtAynHqojWOsCBs1khuLgpdhBoMWuw
         iajl/C3d3+ovwI6Szwwouh8LX1V0V7GDbc4FWL7zQH4C4QwlOw+mzpG99SlSfRwPDQr0
         oDosgUD+/fLq7lunySPyEdRuWhTNL9v/rdGEqAi7LTVMryc7nZNPbIA/xpZV4nnTPSZ1
         vCawwvuax76fh91kJ6w1fJh58UpbRZ/0bMvjjygtC0FNgm3CUTe8in/Cyest3oMe0qGD
         1vmWjCT5Vh8IVGAlkfW45dZIgsgKaXbe9wobviOl3Te4Y6qzQNUbpoFLk0OMcxkRUeS5
         RlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785680; x=1791390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=p1GEa61mCgTiqVUy2bqLgu1ohGi9UZJg7yU4BkdqXgK/yrnzorXWf1FoJH4uPANjlx
         WH4ev7sPSZbn2JAv9pMXaiZxANg5YefrE4Kki9eAEc+unHQTfvl36JPjjIJtFuDOCGgM
         /y0bsd04xmB2gMh/cp4QCc2a2p8Fsi5jPK2emjw/qGNPpGcchLMP7oXJz7RM1J+e0eFr
         f3rleHK/8ekKZpRAHELUX215sypVxQt/zkw7k24qN8NEEuOe5XALDHPmSOy/BiUnRfmA
         GLHbl9BvPN25VOkn5X6YfQgpzOy1O1fs6r8BW3V2QIQoevw9r6qQpkihpPybCp4teJC8
         6GPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpQHe6lEXvG7qGCIZdrxLAXjSYEQFFKCGHNbXhRU+W0IlwPdFwaVMJ4zTQSEOYoUL0QK5uzkcUpvgGEA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJbX3F5XzBSGcRFGzj99ueshAz25cyDLK8EFm9kmvH6mp7wDl1o
	ZXA5iR8nLR8vxbkggu/Y67F/Jhc7gsj/8jsB9sByf7EoLQXCDRi2Wmorz4VuoiSaYUDdJ6hnfEw
	mAn/xvC3M45kSPezGoGIoc5XWIS9atzcublI9iGUAvWUWABErRsRjIFE1VPX7T4mzH6DbvdKp1b
	4HjtXNzkIdgjaK6sml9LwAv4BypE88DU8zd4DkN1S0uKcHoA==
X-Gm-Gg: AYBFou2QVlgx7vRkKMWwfgQ8IdeM8C8NlFXxlLEGMLUju1ShOkzu5rOKi2XeCL0h/UE
	3Qk8DLPdXODjZoAGbmTPhiVnozr3yFH8HKD8X5EzZ9rDQv98UKvWxPmtuBd2Qg3wiHGH3bZNeqA
	2xx09w23AKRs06af9lx5tjqsxljk7DJ9ZJeI0GXvsFbw89OcB8aTCY7FD3kgwNpLrarKElo6lJX
	lEEetxf1JpV29N+tQ==
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id d9443c01a7336-2e2e4918401mr15080155ad.3.1790785679749;
        Wed, 30 Sep 2026 09:27:59 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id
 d9443c01a7336-2e2e4918401mr15079785ad.3.1790785679221; Wed, 30 Sep 2026
 09:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com> <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
In-Reply-To: <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:57:48 +0530
X-Gm-Features: AclHuK_mjB9IIz-du31WR756mfxeN7AReNTvfzYa8Zcb5OIQ5GE1Yf2pFwXiAXU
Message-ID: <CAHuiULASZ4r2DwrJYh8GrkcOFycAROsWN_1Cxnj5PsXWMVFotw@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX/qtXiXYfoYeU
 il0/4BYSR3w3hSwbpnettRz7JBDwI7DFB7rg57qUKZSX9QS2a7sxCaSTv01RvFKuRyPt2ebdRru
 gswIoMfISJSKMMWS/kzcUC/7Z5esP5DqLXYG+zlb1p6z5en/RoeFZbrssS8UB7OkDakHYoR266x
 ybocujEufFg24y4jGf9EHXL+2Pi7gR98IMgrYfLt+Fcoek6pPzscM/kSuwisO7CpO6rG18x2QuX
 +3+LJl1AWhriQRuyVFXErBtc7rDt59tPmiCwlypNK8fOLTWTZMR1UGdV70xD8hpKofnguJKZwB3
 jI1wA6ZQF05g8+LOwUapfZYa48/XRQ7ZCQ0VGD3XCslQ/VzYOQ9iCdRB2qJ8C9qbKj5xNDjRSxx
 3pY42oH2KDuXQ2IT76/RG0/JvgnTUpTgCLrMsJRdgzOwmrvz8MgIHRvFEVFmWid9Z9JgFL5lr48
 JxCRK2F4AkDAguxPiHw==
X-Proofpoint-ORIG-GUID: sFrpJY8bwAeL8WJc6h7yUYDBr1WJdvHK
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd3890 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=lv0vYI88AAAA:8 a=rVxIM9veg9Z6xXw7olMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: sFrpJY8bwAeL8WJc6h7yUYDBr1WJdvHK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX2GLLi1rs0Rro
 e6Zh7i/ZfifX0GJM9wkcFCsf1xn45sGTBz7gvLPR89cor9iDMDb/4wlTQn4oLEH6zcknAI0tlJC
 EuiFhNz7Pasi9X4qcvk8ZdzJ1wtdZCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_092800_955563_400FD60A 
X-CRM114-Status: GOOD (  18.94  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjo1NOKAr1BNIFphbmUgTGV1bmcgPGxpYW5nemhlbkBs
aW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+Cj4gT24gOC8xMC8yMDI2IDExOjIyIFBNLCBNYXl1
cmVzaCBDaGl0YWxlIHdyb3RlOgo+Cj4gPiArc3RhdGljIGludCBydnRyYWNlX29mX3BhcnNlX291
dGNvbm5zKHN0cnVjdCBndHJhY2VfcGxhdGZvcm1fZGF0YSAqcGRhdGEpCj4gPiArewo+ID4gKyAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQsICplcF9ub2RlLCAqcmVwX25vZGUsICpyZGV2
X25vZGU7Cj4gPiArICAgICBzdHJ1Y3QgZ3RyYWNlX2Nvbm5lY3Rpb24gKmNvbm47Cj4gPiArICAg
ICBzdHJ1Y3Qgb2ZfZW5kcG9pbnQgZXAsIHJlcDsKPiA+ICsgICAgIGludCByZXQgPSAwLCBpID0g
MDsKPiA+ICsKPiA+ICsgICAgIHBhcmVudCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGRldl9vZl9u
b2RlKHBkYXRhLT5kZXYpLCAib3V0LXBvcnRzIik7Cj4gPiArICAgICBpZiAoIXBhcmVudCkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICBwZGF0YS0+bnJfb3V0Y29u
bnMgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfY291bnQocGFyZW50KTsKPiA+ICsgICAgIHBkYXRh
LT5vdXRjb25ucyA9IGRldm1fa2NhbGxvYyhwZGF0YS0+ZGV2LCBwZGF0YS0+bnJfb3V0Y29ubnMs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKCpwZGF0YS0+
b3V0Y29ubnMpLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmICghcGRhdGEtPm91dGNvbm5zKSB7
Cj4gPiArICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4gPiArICAgICAgICAgICAgIGdvdG8g
ZG9uZTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGZvcl9lYWNoX2VuZHBvaW50X29mX25v
ZGUocGFyZW50LCBlcF9ub2RlKSB7Cj4gPiArICAgICAgICAgICAgIGNvbm4gPSBkZXZtX2t6YWxs
b2MocGRhdGEtPmRldiwgc2l6ZW9mKCpjb25uKSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICAgICAg
ICAgIGlmICghY29ubikgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGVw
X25vZGUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgcmV0ID0gb2ZfZ3JhcGhfcGFyc2VfZW5kcG9pbnQoZXBfbm9kZSwgJmVwKTsK
PiA+ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG9m
X25vZGVfcHV0KGVwX25vZGUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4g
KyAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJlcF9ub2RlID0gb2ZfZ3Jh
cGhfZ2V0X3JlbW90ZV9lbmRwb2ludChlcF9ub2RlKTsKPiA+ICsgICAgICAgICAgICAgaWYgKCFy
ZXBfbm9kZSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoZXBfbm9kZSk7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAg
cmRldl9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3BvcnRfcGFyZW50KHJlcF9ub2RlKTsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgcmV0ID0gb2ZfZ3JhcGhfcGFyc2VfZW5kcG9pbnQocmVwX25vZGUsICZy
ZXApOwo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgb2Zfbm9kZV9wdXQoZXBfbm9kZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb2Zfbm9k
ZV9wdXQocmVwX25vZGUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHJk
ZXZfbm9kZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAg
ICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgY29ubi0+c3JjX3BvcnQgPSBlcC5wb3J0Owo+
ID4gKyAgICAgICAgICAgICBjb25uLT5zcmNfZndub2RlID0gZGV2X2Z3bm9kZShwZGF0YS0+ZGV2
KTsKPiA+ICsgICAgICAgICAgICAgLyogVGhlICdzcmNfY29tcCcgaXMgc2V0IGJ5IGd0cmFjZV9y
ZWdpc3Rlcl9jb21wb25lbnQoKSAqLwo+ID4gKyAgICAgICAgICAgICBjb25uLT5zcmNfY29tcCA9
IE5VTEw7Cj4gPiArICAgICAgICAgICAgIGNvbm4tPmRlc3RfcG9ydCA9IHJlcC5wb3J0Owo+ID4g
KyAgICAgICAgICAgICBjb25uLT5kZXN0X2Z3bm9kZSA9IG9mX2Z3bm9kZV9oYW5kbGUocmRldl9u
b2RlKTsKPiA+ICsgICAgICAgICAgICAgZndub2RlX2hhbmRsZV9nZXQoY29ubi0+ZGVzdF9md25v
ZGUpOwo+ID4gKyAgICAgICAgICAgICBjb25uLT5kZXN0X2NvbXAgPSBndHJhY2VfZmluZF9ieV9m
d25vZGUoY29ubi0+ZGVzdF9md25vZGUpOwo+ID4gKyAgICAgICAgICAgICBpZiAoIWNvbm4tPmRl
c3RfY29tcCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FUFJPQkVfREVGRVI7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoZXBfbm9kZSk7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQocmVwX25vZGUpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIG9mX25vZGVfcHV0KHJkZXZfbm9kZSk7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgcGRh
dGEtPm91dGNvbm5zW2ldID0gY29ubjsKPiA+ICsgICAgICAgICAgICAgaSsrOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gK2RvbmU6Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBwZGF0YS0+bnJfb3V0Y29ubnMgJiYgcGRhdGEtPm91dGNvbm5zOyBp
KyspIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb25uID0gcGRhdGEtPm91dGNvbm5zW2ld
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChjb25uICYmIGNvbm4tPmRlc3RfZndub2Rl
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZndub2RlX2hhbmRsZV9wdXQoY29u
bi0+ZGVzdF9md25vZGUpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArICAg
ICBvZl9ub2RlX3B1dChwYXJlbnQpOwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIGludCBydnRyYWNlX29mX3BhcnNlX2luY29ubnMoc3RydWN0IGd0cmFjZV9w
bGF0Zm9ybV9kYXRhICpwZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBhcmVudDsKPiA+ICsgICAgIGludCByZXQgPSAwOwo+ID4gKwo+ID4gKyAgICAgcGFyZW50ID0g
b2ZfZ2V0X2NoaWxkX2J5X25hbWUoZGV2X29mX25vZGUocGRhdGEtPmRldiksICJpbi1wb3J0cyIp
Owo+ID4gKyAgICAgaWYgKCFwYXJlbnQpCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4g
Kwo+ID4gKyAgICAgcGRhdGEtPm5yX2luY29ubnMgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfY291
bnQocGFyZW50KTsKPiA+ICsgICAgIHBkYXRhLT5pbmNvbm5zID0gZGV2bV9rY2FsbG9jKHBkYXRh
LT5kZXYsIHBkYXRhLT5ucl9pbmNvbm5zLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKCpwZGF0YS0+aW5jb25ucyksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAg
aWYgKCFwZGF0YS0+aW5jb25ucykKPiA+ICsgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiA+
ICsKPiA+ICsgICAgIG9mX25vZGVfcHV0KHBhcmVudCk7Cj4gPiArICAgICByZXR1cm4gcmV0Owo+
ID4gK30KPgo+IEhpLAo+Cj4gVGhlc2UgZnVuY3Rpb25zIG9wZXJhdGUgc29sZWx5IG9uIGdlbmVy
aWMgZ3RyYWNlIHN0cnVjdHVyZXMuVGhleSBzaG91bAo+IGJlIG1vdmVkIHRvIHRoZSBndHJhY2Ug
Y29yZSBhcyBjb21tb24gaGVscGVycyB0byBhdm9pZCBkdXBsaWNhdGlvbi4KPiBUaGlzIGlzIHBh
cnRpY3VsYXJseSBpbXBvcnRhbnQgZm9yIG1peGVkIHRvcG9sb2dpZXMgd2hlcmUgUklTQy1WCj4g
dHJhY2UgY29tcG9uZW50cyAoZS5nLiwgQVRCIGJyaWRnZSkgY29ubmVjdCBkaXJlY3RseSB0byBD
b3JlU2lnaHQKPiBjb21wb25lbnRzIChlLmcuLCBmdW5uZWwsIFRNQykuCj4KWWVzLCBJIGhhdmUg
bW92ZWQgdGhlbSBpbnRvIHNlcGFyYXRlIGZpbGUgaW4gdjYuCj4gUmVnYXJkcywKPiBaYW5lCj4K
Pgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
