Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29249606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZSiQ5c+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kz71YDOC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcfz4RdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EzkJu487kL4hJJP5x+y0UbBoGugPfb7PheISz6n6yEc=; b=iZSiQ5c+YFG2cixBtyr7ZfVBBK
	D9YHtAZRHg9148Qin6K58hIctjXsZ9RyFkUrOwebdKPwofl/0KRo486DsTdjCEFAVgtWQHUbLBrHN
	WZiIu/Ih18MEJEI4vRWn++elmUJdgBz3RauAJqzQOMQOC/W177GmT6N7cYhBVZtGKP8s4OI1Ihu7+
	UEUCzGWxiVwzcYQ5V9WkTdfTsCmloE4MSP1CzJ3jq0DQ6Hk8/hd+z5jrRw50JzoQYY9EGcanHFnaZ
	9RI6aNoCR9Plk01hs6AIa0zP25wkJlnr++r/sw8BapHjuoSGgIRJMvf46es+luINHgLdKvtZCbR9/
	gEFxtXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmDy-0000000ByFa-3VCl;
	Fri, 13 Nov 2026 08:01:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmDS-0000000By6W-0KyS
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:01:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD579qi367318
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 08:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=; b=Kz71YDOCG6MGa4OO
	omCac5hqmQ8LB6GGuYtwxpMC8O5C2E5AgJCvsmrKeQXyNvJIuHbIMTCwUTUmmoPp
	dBpjqftP24hkxQp5YR6oxPSajBE64d6hxGD2nJ8pjqIDtYmzySzzmLdA/iXh/eAH
	/rnXG2CIi57BVkDsZsRCUPtXF8YX1EKQLpiOR3b6oenFbanMvu0T34Ne0/3x+kAm
	r3t3tnr2KZBmoB4pkvQAxHTXAYOePUnU5Q02J5XGJVuf59h4SEOdmlDdiRTJf3EC
	cxFXjaVocK+D0o+mAsCzMcIUxj9/KkcoPadzhdCunDEzqx1pZawYVNoMoplsJR3n
	ukoKzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx344wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 08:00:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so2506993eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556855; cv=none;
        d=google.com; s=arc-20260327;
        b=SC7Uy7dcAZ6UGb94zofkUD+oYrnbcRiruQXrgIVunIrlG1M/5CotzjeHnIA6v4e5oY
         883d7gXlMbxEvzfPETf4p37Z/fitTLJN1ZEjPtNGq+GrcKcZWHTIXCue3h+JGR5UPJb+
         xSF42uxgwdjJn8zfVJsc62Zwy4FIW1npAI9vdwUs4d8agv4SCnpEBwgpoO3rueIbHn1S
         igIC6WkMbKtsmyDKTjuKh4pLKK0Ml6faJipQ90rLG+a1dooPtZhbdFQQ+rBlcY6GKzn+
         ZQtiv4oNMW5e6lwTApMKkCbdsLJ5Te2DzD8LpDfZMN3inDSCVuUUI8HuYfLlhMeBkNZH
         FBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        fh=jtAc73LGRNwrBj7MbdgPUVmrTkEYF8WeSJ4xqZic6FE=;
        b=qZXqxbshmCH6XNX79Z5sLUymP+CwKKpbf8nTjDsIZ7dZpwgUjGJF4ag4A2Vgyd1AUW
         qJkSgfgPEjTri3oiRba+aWL5nXWc70hfX+1ruFPV+y3NzT9OJTQTZ9iIevFEKsSd/7U2
         Bv8cL52uDqOSKizGwxHVLqo7LXFMC05g85BRLn+J+3lKyIlpWl8a7D70NvbHoHbhHqJI
         Pq9yTU1vmM7RHJO6TZ1Edf4+E8tOiLe/3GtzjHJlv3TzpbzoUgHNr3EFkeVNVhPftdTX
         /MFZ6jEyfJnG8oVvzjRpHDGjHQjeor4PeH0BPcTLciZVUKm2zsEk30NnHRWrUOL9huIj
         tRjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556855; x=1795161655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=fcfz4RdSC1UvpybcesXYCuHKZZQdPMSaC1HgTnfus97ULGZOh24Jp857Ht5tctVwkY
         1pWmN30h99cdRfY5TXIItEiafWbtip8XOvIUF+Y5JwNV0u+YoadeoYQpAi9mjF1Pq3qG
         jgqYry1SWYOzlJM2Wggi0XPGnTL3Z3/2CoDUME8NLyT8qQfqDCCbgLaiQxq5UpTXV6tA
         RrckYbyBh9/3Xdn2cuu7WkaJU9fMH3K8/7Fvt89e9SotaZH/4pMWf55mcP5yBKLrri1p
         VpyoSitzBoh9C5n4Ois6rFw0Ot6tigrFL4YlISsLm0cmu3V7+E8FHvmnwgBkmEfJx0IK
         aFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556855; x=1795161655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=uUFu8Yt4YNPwL+7URjafguvJdaYGZ+f4CZif2IRyCxMP0JkUNbxZC/4oJU9z19wbcI
         EHke4QDPZEEwXq6x7IFuZqjLcTaipHtdlscCHIl01mpA8hn6R+36/OiXMDUyPS0wMyb2
         us4xj2OSYeunUS/05nCtuVBCV+I98pos4H3I6KUT1fYi9Dz+Jcq09ubjh4M89fsI1L0g
         ElKby1++shJJpycqfk9LZz5KgsLe3b2afSPi6MkL7LuDSXmDG1hBEanbs01heOBtjKHy
         1ounLO7zwWC4uVwQkPAqcaKvX/H3zbYF4JOvDH4uP6LUURoiraQnsyTJBonTS+BlloYy
         HeeA==
X-Forwarded-Encrypted: i=1; AL+hErFn4MqZLieroW16dnGWpVJR6Xpi3XbcYmpQ8BWirWKo9qten4y90WfSlqwl1InfhN6CojG+vLtCDp+5Uw==@lists.infradead.org
X-Gm-Message-State: APuU4Z96fDmuLYZVS/3XNxbmh1xdhVQlhpre57fulualBGhtXEgMYT0S
	VR+iQo3yqxqDxw/OfNIduhYutO5+scRtss6wIGxDJDUKGiBjoEpamYIfgMbcL+o8BTveWSxo5ck
	D6oNFqk16k/wHZpuEIGIbpCscPGXlLwDmJB9mQNFHHBG/TzCrTd79WxSVty5JJXoPlveWyCft21
	8M7VA9okH78LiSuVZ1Z9SqouY2n/N9lmGD+feMj1Wi7vQ5wg==
X-Gm-Gg: AYBFou08LOwdCGzDuXz/zeknz8EDWTRl6rwVb6OkLSMb3L+xzMCTkzSqDob4tjIm0YR
	WfjSqL2Dgxs36bLYQsJn9ZSsLOK8NOhg65qDRkSzqkJ9ZAZSTaJDcSuWETrWevFrr6UiVW6nv5X
	T39xKa4H8zODFx254piax6aV+Zq2ycz0Ytn3AzymTDIPD0tR3xqYAw4SozJS8=
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr1454889eec.25.1794556855305;
        Fri, 13 Nov 2026 00:00:55 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id
 5a478bee46e88-37966766d98mr1454857eec.25.1794556854546; Fri, 13 Nov 2026
 00:00:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
In-Reply-To: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:30:42 +0530
X-Gm-Features: AclHuK9I8L1Jkoa68vnSH3mJyt49oobnf7EDpmkY2TDzdHkp1PyujMbXCJ4T8rI
Message-ID: <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6c3b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=loDQXBK_udfRwOWNHxcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX48lV+yIgdxdr
 3y7TEmnS7palmKDDDgn8faqed1rWPTZC+e+SZJXdShMWF8PEWt93ypw4ZFk6xLlaA/LjA0sXdho
 pf8rSvaIZ1MOcU0meFLIFY8G9nXoRjOPQxyxMALsdT2ONgd4vpLr/sojhj2yZWOoJF9+iIpwMIS
 UOAkmzHqnS9WodPgOKG4HZU37st9WdbefsVIi9mWlS+6dptfzGlWeFGMOF7xGlZ32Ti6ge5lEFb
 qDixaMFnLiTuC/EvmcO3E/cDGfx5gvpcZKh6oxszfSKNgl2zLHTGmKnTB//D5g07FNxTT8aGdbP
 Y4GRvy4a5AsvwwNOPXF0KEsV1Mv7hAI/yP/A+3Ym9Kr0I0MqYQHmYSn5EGs1/scYGPsdfxiKhMT
 M9a9njsbSmYApH+a/JBk4Y6nkt1vQ2wHjGq+opUc4emDaa80UWuD+TKaNjSYHdcHDuhxCrtNX62
 tlleNHSMnBrHfd9poaQ==
X-Proofpoint-ORIG-GUID: lWrxk50co7O4Us_M9X-mnGwC-8sKvJFy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXz7vLV4xMwF+R
 WKTaVFtVMb1FOo7kebpjfw4bGSbcSrXhRcsLuuwUDGnOpoNNy7rsXIgq+dB5RndDa1W3sb6O6t/
 A8ldeCU4a3o1i2lb5mGOM1x6KEP6O+k=
X-Proofpoint-GUID: lWrxk50co7O4Us_M9X-mnGwC-8sKvJFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000058_704667_49D37D14 
X-CRM114-Status: GOOD (  34.42  )
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

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgNzo1NuKAr1BNIE9sZWtzaWkgS3Vyb2Noa28KPG9sZWtz
aWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNp
Y19pbmplY3QoKSB3cml0ZXMgdGhlIGludGVycnVwdCBpZGVudGl0eSB0byB0aGUKPiBTRVRJUE5V
TSByZWdpc3RlciBvZiB0aGUgdkNQVSdzIElNU0lDIFZTLWZpbGUgd2hpbGUgaG9sZGluZyB2c2Zp
bGVfbG9jawo+IGZvciByZWFkaW5nLiBUaGUgbG9jayBrZWVwcyB0aGUgVlMtZmlsZSBmcm9tIGJl
aW5nIHN3aXRjaGVkIHVuZGVyIHRoZQo+IGluamVjdG9yOiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1z
aWNfdXBkYXRlKCkgYW5kCj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3JlbGVhc2UoKSB0YWtl
IGl0IGZvciB3cml0aW5nIHRvIG1vdmUgdGhlIHZDUFUKPiB0byBhIG5ldyBWUy1maWxlIG9yIHRv
IHRoZSBTVy1maWxlLCB0aGVuIHJlYWQgYW5kIGNsZWFyIHRoZSBvbGQgVlMtZmlsZQo+IGFuZCBm
cmVlIGl0cyBIR0VJIGxpbmUuCj4KPiBPbiBSSVNDLVYsIHdyaXRlbCgpIGlzIGZvbGxvd2VkIG9u
bHkgYnkgbW1pb3diX3NldF9wZW5kaW5nKCkuIFRoZQo+IHRyYWlsaW5nICJmZW5jZSBvLHciIGlz
IGRlZmVycmVkIHRvIHNwaW5fdW5sb2NrKCkgYnkgdGhlIG1taW93YigpCj4gdHJhY2tpbmcsIGFu
ZCByd2xvY2tzIGRvbid0IHRha2UgcGFydCBpbiB0aGF0IHRyYWNraW5nOgo+IHF1ZXVlZF9yZWFk
X3VubG9jaygpIGlzc3VlcyBqdXN0ICJmZW5jZSBydyx3IiBiZWZvcmUgdGhlIEFNTywgd2hpY2gK
PiBkb2Vzbid0IG9yZGVyIGRldmljZSBvdXRwdXQuIFNvIHRoZSBTRVRJUE5VTSB3cml0ZSBjYW4g
c3RpbGwgYmUgaW4KPiBmbGlnaHQgYWZ0ZXIgYW5vdGhlciBoYXJ0IGhhcyBvYnNlcnZlZCB2c2Zp
bGVfbG9jayBiZWluZyByZWxlYXNlZC4gSWYKPiB0aGUgb2xkIFZTLWZpbGUgaXMgcmVhZCBhbmQg
Y2xlYXJlZCBiZWZvcmUgdGhlIHdyaXRlIGxhbmRzLCB0aGUKPiBpbnRlcnJ1cHQgaXMgbG9zdC4g
SWYgdGhlIEhHRUkgbGluZSBoYXMgYWxyZWFkeSBiZWVuIGhhbmRlZCBvdXQKPiBhZ2FpbiwgdGhl
IGludGVycnVwdCBlbmRzIHVwIGluIGFub3RoZXIgdkNQVSdzIFZTLWZpbGUuCj4KPiBBZGQgYW4g
ZXhwbGljaXQgUklTQ1ZfRkVOQ0UobywgdykgYWZ0ZXIgdGhlIHdyaXRlIHRvIHRoZSBWUy1maWxl
LCB3aGljaAo+IGlzIHdoYXQgc3Bpbl91bmxvY2soKSB3b3VsZCBpc3N1ZSB2aWEgbW1pb3diKCku
Cj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJuZWwgdmly
dHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIEt1cm9j
aGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KPiAtLS0KPiBXaHkgUklTQ1ZfRkVOQ0Uo
bywgdykgYW5kIG5vdCBtbWlvd2IoKToKPgo+IC0gU2luY2UgdGhlIG1taW93YigpIHJld29yayBp
biB2NS4yIChlLmcuIGNvbW1pdCA2MGNhMWU1YTIwMGMKPiAgICgibW1pb3diOiBIb29rIHVwIG1t
aW93YiBoZWxwZXJzIHRvIHNwaW5sb2NrcyBhbmQgZ2VuZXJpYyBJL08KPiAgIGFjY2Vzc29ycyIp
KSwgbW1pb3diKCkgaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIG9mIHRoZSBzcGlubG9jawo+
ICAgY29kZS4gRXhwbGljaXQgaW52b2NhdGlvbnMgd2VyZSByZW1vdmVkIGZyb20gZHJpdmVycyBi
eSBjb21taXQKPiAgIGZiMjRlYTUyZjc4ZSAoImRyaXZlcnM6IFJlbW92ZSBleHBsaWNpdCBpbnZv
Y2F0aW9ucyBvZiBtbWlvd2IoKSIpIGFuZAo+ICAgZnJvbSB0aGUgZG9jdW1lbnRhdGlvbiBieSBj
b21taXQgOTE1NTMwMzk2Yzc4ICgiRG9jdW1lbnRhdGlvbjogS2lsbAo+ICAgYWxsIHJlZmVyZW5j
ZXMgdG8gbW1pb3diKCkiKSwgc28gYWRkaW5nIGEgbmV3IGRpcmVjdCBjYWxsZXIgd291bGQgZ28K
PiAgIGFnYWluc3QgdGhhdC4KPgo+IC0gUklTQ1ZfRkVOQ0Uobywgdykgc3RhdGVzIGV4YWN0bHkg
dGhlIG9yZGVyaW5nIG5lZWRlZCBoZXJlIChkZXZpY2UKPiAgIG91dHB1dCBiZWZvcmUgdGhlIHN0
b3JlIHRoYXQgcmVsZWFzZXMgdGhlIGxvY2spLCB3aGljaCBpcyBmaW5lIGZvcgo+ICAgYXJjaC1z
cGVjaWZpYyBjb2RlLCBhbmQgaXQgaXMgdGhlIHNhbWUgaW5zdHJ1Y3Rpb24gbW1pb3diKCkgZXhw
YW5kcyB0bwo+ICAgb24gUklTQy1WLiB3bWIoKSAoImZlbmNlIG93LG93Iikgd291bGQgYWxzbyB3
b3JrIGJ1dCBpcyBzdHJvbmdlciB0aGFuCj4gICByZXF1aXJlZC4KPgo+IFNjb3BlOiB0aGlzIG9u
bHkgb3JkZXJzIHRoZSB3cml0ZSBiZWZvcmUgdGhlIGxvY2sgcmVsZWFzZS4gV2hldGhlciBhCj4g
d3JpdGUgdGhhdCBpcyBhbHJlYWR5IGluIGdsb2JhbCBtZW1vcnkgb3JkZXIgaXMgZ3VhcmFudGVl
ZCB0byBoYXZlCj4gdGFrZW4gZWZmZWN0IGluIHRoZSBvbGQgVlMtZmlsZSBiZWZvcmUga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZSgpCj4gb3Iga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2lj
X3JlbGVhc2UoKSByZWFkcyBhbmQgY2xlYXJzIGl0IGlzIGEgc2VwYXJhdGUKPiBxdWVzdGlvbiwg
c2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1haWEvaXNzdWVzLzE3Mi4gSWYgaXQK
PiBpc24ndCwgdGhlc2UgcGF0aHMgd2lsbCBhbHNvIG5lZWQgdG8gZHJhaW4gdGhlIG9sZCBWUy1m
aWxlLCBhbmQgc3VjaCBhCj4gZHJhaW4gZGVwZW5kcyBvbiB0aGUgb3JkZXJpbmcgYWRkZWQgaGVy
ZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA3ICsrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBmMTdk
YzU1OWE3MDkuLjgwN2JiNzNhMTI5YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTEwNTYsNiAr
MTA1NiwxMyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCj4KPiAgICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4g
ICAgICAgICAgICAgICAgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlP
X1NFVElQTlVNX0xFKTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICog
cndsb2NrcyBkb24ndCBwYXJ0aWNpcGF0ZSBpbiBtbWlvd2IoKSB0cmFja2luZywgc28gb3JkZXIK
PiArICAgICAgICAgICAgICAgICogdGhlIHdyaXRlIHRvIHRoZSBWUy1maWxlIGJlZm9yZSByZWxl
YXNpbmcgdnNmaWxlX2xvY2ssCj4gKyAgICAgICAgICAgICAgICAqIGkuZS4gYmVmb3JlIHRoZSB2
Q1BVIGNhbiBiZSBtb3ZlZCBvZmYgdGhpcyBWUy1maWxlIGFuZAo+ICsgICAgICAgICAgICAgICAg
KiB0aGUgVlMtZmlsZSByZWFkIGFuZCBjbGVhcmVkLgo+ICsgICAgICAgICAgICAgICAgKi8KPiAr
ICAgICAgICAgICAgICAgUklTQ1ZfRkVOQ0Uobywgdyk7CgpBbm90aGVyIGZlbmNlIGFmdGVyIGV2
ZXJ5IHdyaXRlbCgpIGlzIGEgYmlnIGhhbW1lciBpbiB0aGUgcGF0aC4KCklmIHRoZSBpbnRlbnRp
b24gaXMgdG8gaGF2ZSBjb3JyZWN0IGNvbnRlbnRzIHdoZW4gVlMtZmlsZSBpcyByZWFkIHRoZW4K
YmV0dGVyIHBsYWNlIHRvIGFkZCBhIGZlbmNlIGlzIGF0IHRoZSBzdGFydCBvZiBpbXNpY192c2Zp
bGVfbG9jYWxfcmVhZCgpLgoKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGVp
eCA9ICZpbXNpYy0+c3dmaWxlLT5laXhbaWlkIC8gQklUU19QRVJfVFlQRSh1NjQpXTsKPiAgICAg
ICAgICAgICAgICAgc2V0X2JpdChpaWQgJiAoQklUU19QRVJfVFlQRSh1NjQpIC0gMSksIGVpeC0+
ZWlwKTsKPgo+IGJhc2UtY29tbWl0OiA3MmQzZmNmODAyYzQ1ZDAwYjMwMGYyNWI4NDhhOTNjM2Ey
YmQ3YzdlCj4gLS0KPiAyLjU2LjAKPgo+Cj4gLS0KPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4g
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
