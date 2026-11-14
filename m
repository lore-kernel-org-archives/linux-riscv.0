Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF1606A329
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BrVDKz1C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dlGROvAc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OSNcT3ww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5wFOGww4xjOCl6htCTlrGg3TAaTvyY0lD1GW1lDitQU=; b=BrVDKz1CR/0gzVhBQqHVRf/EUa
	vFr3izbSTdDqVV6lU/u0QrJGGymwwHUatARKEi93saNjM1FswhohAz9pPGilA44voap0CnBhx/CMH
	HNmfZDXlFT3gT4JAtLfjl6PCUeA+M+rbO5nC+q3qnU+6SU5geMAlYEvqyz/AfgL5yViNSRlCwe0ya
	WrvJIYNspChfwqwwT5P5U6AiSVaqGRfDGGfOssqEB4niZ0C0kwimD/5PRyLupN6KrbX6R9XKafB2I
	kS4nSCqgEkqrU2L6MQwdCzfQ+iSZV+2X30nHl8/Szlx/qw2YJ4DxY5fuXKxa509LdJiIDY75ubSOb
	6k/hCmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSC0x-0000000FuCj-3OLm;
	Sat, 14 Nov 2026 11:33:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSC0v-0000000FuCH-3bwZ
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 11:33:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wC903379147
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 11:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=; b=dlGROvAcsPVce7rB
	7jYMcmpMP5EC7n6vqtae59gEYYfiazxVySMuuNPHGrMjSQq9gTt6ETbaSLGoxNaj
	6jOcBI5CV6fOuutnW16tj8iSGO6rvmF64l+JacIBdSB00LPDbcXDY3Fg/fhTMAdJ
	KFt8pyuCCXOGz+hFbtpXGhCU6906mvDJ5LyfoiERzRN42yKzt9e8B2kh1OyuLJYG
	UJqi1zUYrQ82qGjwmWJ2G665UuHEGinAFyG4UwA6mRksm7UhpnktbZmjAugCgvM2
	455gZ7uBXnFG1wi8/9bOybFZsbG4sKImEQVnC/+p95oGmHdgxmrNeN6N+5NsIlK8
	+ql11w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0ncb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 11:33:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eced5a4cb9so14758975ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 03:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794656023; cv=none;
        d=google.com; s=arc-20260327;
        b=ZOY/VWkjHMAkPtY10gCn0vmEfOUR0HBjsW2z23Gdsn0Dx6BSDRg0BeO+M7uCOYz4Pz
         wJF0k8km7Vq+n2jw8osIhB0k99WhVQHTvQnVMUuyd3gKO7c9ExBDPSGR1SJWRmcsLyUE
         Dh4XufCJvE8+LdICHONNbge16EJ8i7+cqHeMUqewLuOmbjVMapVrYS7Xj/UCmdBEpJpg
         aRndoCYdHKs7pyfBK/U+Sq6OXbBy5jrICnmyKO0pHzgTqUsmHLfV0m+ZaB1MrDjg+lje
         tq1EW3sEAZG3X7GiFeKQiNo0P5U/asjnmSanhk+8o1AaIywvU4p3IdrqPT6f6iIjbcwf
         CKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        fh=UGIISXPtmNaTQE7ubbXsIGZwRcSYqBVR3IJs8JPRKPM=;
        b=BfMzrHvPX60Ml44HoJQDDIY2x+Zo+TqtTxNhWO3Gcuo0PyUpgOYu3AErh0xf3x3tn+
         mZHMRmdOTpWueY9SEqxG3vC1vvYaYGPbQavrvJVw4tmaSePvnU+ApAPM38p3jiSAfqZs
         v/XddhGPd8sYycuku9tIOx6SLFUhL1p1xAA/GWzBGRljHjhf2DeCE6r+bi7hPmw8xe+G
         1b1keDER/nYrAWE9sq86QbfqXQJgJS2aCvYdk5zG2dlFLWgl9TWWm1cJk8eE6P13vW61
         jVTN7EMjtefzZTRTTmvsldqdn6ya7HO2QdPkxotKsY2GXXqJ83XA7aDFCoBkoUYZGI+Z
         lQMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794656023; x=1795260823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        b=OSNcT3wwshSulzR83pXU4tHPTTrxdJF3FZxcUiLF5F8hrJrAC1uAubu4k329rqOtHk
         kpWm9+16ktXCczXdvAMTvvbLDc7s+zOFEVB/ggz+fvzHCUqexkLTsGyD0Wwxd0xOl6YA
         tk6WR4CZZIyQaBGlRd6mg6t8nCb7PsO6zKTDEQ1jG11l4cp7lmjxN861PFiLt8k+Nwn1
         H/IVkg1hYjSqa0BjYAsaMuSNRfXDqQXwsWWX3FJnBPc6TRd4+Mii97jSJV8Cn4FO6St+
         dIgud/5QnRfvqyIYFHCt1rb+yWdErIiLtTvge7icLun3vVGFuz3qbGTF2KxKou7NrWhI
         ArqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656023; x=1795260823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        b=hNCziJaPm8WfuZFE1QSJEDRantsmIwfQ8R8C1UJ/L4aED5WCIfbo1CAUcHJh/w/cRu
         3nFC1SBy4axbdCrHg7nhunjyCimhcB2Q7O9V1Ie7XKfGeCOybgTpf8Vmzk7GcFCJBJGW
         OVFhCNSDc8owamEK6pfL2ADQapeQzY479MIFsyUL1ki+R2K6JboqbHNr3piRUpENHMDp
         yVQNed+AlKhfMERrAMv0GSLc6aSMdfafLxfe9keLvLt5XO3PjNaplBaITfq1Jg3UyA+B
         d9YAq8V2bcLYP12GzpAt7hfR9YPJ/y1JYnoIHIX9bazr+LuA9oQunOqKAGYfIYDx9zU6
         x46g==
X-Forwarded-Encrypted: i=1; AL+hErF2tp326zwNTAwpLX5qLOAwjeUgJ+kYcXV+ykq5OvX3rYZ7bvw2ggHVJ2WnRjIfAcZ06fnNUGGK3Jnv9g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9DbJkX9Jom/Esp+1zO+AC0lktYcsYCdWqGGfWQ2kMvCqJb//Ql
	/uGtE+qPkESbWu0HkEK16v3MEY4OBHllrVjX461FVxjM49mCYD+rLh96l9tgn+Izt3kBh/b0Wpm
	kbYlJrvw+o5jUz1LZXVkmcYPCZMep3MRzmFwBUFWLz1cAgBCb6WvYLmMvM2A5EgXuKlE61OwmSt
	IIYMu0Rrw0F0GY3JihVE55t1L+gCzUXoi53STi3tSUgLYCWQ==
X-Gm-Gg: AYBFou0CkTvWL0RFFtJ4BVT8TbJNkXuEp4S3c6A/FxwJH1LP9pAesqNszKl6PoiX5mF
	Xym39BQTVWgdrDGXG3WZx0fVKiWl1h6Y6GaFEfVFWoF5icO0n/b7zq2ZFBDPFAd3Ld09mMGkIfx
	4+yf5L+XDfcx9kGe7l6lHf/2btqKJzq2d/rFoaKTX0nZaVG0xAfiLqle4gdg==
X-Received: by 2002:a17:90b:5910:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b1b0a1fe6emr4265336a91.26.1794656023183;
        Sat, 14 Nov 2026 03:33:43 -0800 (PST)
X-Received: by 2002:a17:90b:5910:b0:3a0:516d:9f88 with SMTP id
 98e67ed59e1d1-3b1b0a1fe6emr4265318a91.26.1794656022663; Sat, 14 Nov 2026
 03:33:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
In-Reply-To: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:33:31 +0100
X-Gm-Features: AclHuK_taegd5bAzuybJmQPC1z-fZC_MIChsvwsEmWXiwFzgCH5zCy6riPEsdLY
Message-ID: <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via device link
To: Yixun Lan <dlan@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX1+RPHRmVUPq+
 Hujkaypww51FIAguwtXSonr9mJaXNr6tLtXBcckejZggUe7P83O6LZtUPLnpCASVun3KvRCDq7y
 gn8N+bge9/Zreij/bN06hHS+c9Xr/jL7WoLzVsG1bZY9fkNEMvPhqA88lmKat16PtV2xF0HeHo4
 2xr5Mr+jngkpeu5AOQYjikjgCfcjzZNWhBhVofwrzSj+w/pNjcvJ5839podN4rji7e6sDa8mBuC
 ZaUAVj7q/SRu/hsRIzOX/sX+QtD2zNUdSE/2LouM2CzTa02c+KL2oSkOl++gsVM58Kze0M4mHie
 wXvlGSSKIiaUbVp3wjKQIfSllU9GOYWw4g+oz8dAeBMB1NERihaD5Le+u53y8tciNTfoUpa5c4G
 WX7ysLLEvVmN+xLSpNXz7t7ENMsrkeicqilbDhLkttovvvLh7Mb0MzK+V/g0MA9ZmlK85XJgqOJ
 DOtTO29AvaMcXMzgDqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyUJpslmCHw1Y
 JzMpF8qY80cZ+q5ZO/ckrIXym/RXJlzI5D9hM3kllWvqc+RWM1QjEsV+YiDDE6uGL7xuRKmg6rq
 LjnAskl2Q/K5Ql8NObBtZMIZpbfyFZ0=
X-Proofpoint-ORIG-GUID: 48NNkQC8xHGygMmwIenf0CqUl98B6UP8
X-Proofpoint-GUID: 48NNkQC8xHGygMmwIenf0CqUl98B6UP8
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af84718 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8
 a=7_BkkAeRn8r4wxPsRKMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_033346_022055_34A1FEE1 
X-CRM114-Status: GOOD (  23.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTIsIDIwMjYgYXQgODo0NeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IENvbm5lY3QgZG93bnN0cmVhbSBQb3dlciBEb21haW4gY29uc3VtZXIg
d2l0aCB0aGUgc3VwcGxpZXIgdGhyb3VnaAo+IHRoZSBkZXZpY2UgbGluayBBUEksIFNvIHdoZW4g
dGhlIHBtZG9tYWluIGRyaXZlciBpcyB1bmxvYWRlZCBvciB1bmJpbmRlZCwKPiB0aGUgY29uc3Vt
ZXIgY2FuIGJlIGF1dG9tYXRpY2FsbHkgbm90aWZpZWQgYW5kIHB1cmdlZCBncmFjZWZ1bGx5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CgpDYW4geW91IGNo
ZWNrIGlmIHRoZSBiZWxvdyBjb21taXQgdGhhdCBzaXRzIG9uIG15IGZpeGVzIGJyYW5jaCBzb2x2
ZXMKdGhpcyBwcm9ibGVtIGZvciB5b3U/CgplMjc5ODMzYTUzNjIgcG1kb21haW46IGNvcmU6IFdh
aXQgZm9yIGRldmljZSBsaW5rIHJlbW92YWxzIGJlZm9yZQpkcm9wcGluZyBnZW5wZC0+ZGV2CgpL
aW5kIHJlZ2FyZHMKVWZmZQoKPiAtLS0KPiBUaGUgcG93ZXIgZG9tYWluIGRyaXZlcnMgdW5kZXIg
cG1kb21haW4gc3VieXN0ZW0gc3VmZmVyIGZvbQo+IHRoZSBwcm9ibGVtIHRoYXQgdW5hYmxlIHRv
IG5vdGlmeSB0aGUgZG93bnN0cmVhbSBjb25zdW1lciB3aXRoCj4gbW9kdWxlIHVubG9hZCBvciB1
bmxpbmsgZXZlbnQsIGxlZnQgd2l0aCBzdGFsZSBzeXNmcyBpbnRlcmZhY2UuCj4gIEN1cmVudGx5
LCB0aGUgc29sdXRpb24gaXMgYSkgdXNlIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKCkgQVBJCj4g
dG8gZGlzYWJsZSB0aGUgbW9kdWxlIHVubG9hZGluZyBiKSBhZGRpbmcgc3VwcHJlc3NfYmluZF9h
dHRycyBmbGFnCj4gdG8gZGlzYWJsZSB0aGUgdW5saW5rIGludGVyZmFjZSwgd2hpY2ggcHJldmVu
dCBpdCBmcm9tIGJlaW5nCj4gdHJpZ2dlcmVkIGZyb20gdXNlciBzcGFjZS4KPgo+IFRha2Ugc3Bh
Y2VtaXQgSzMgcGxhdGZvcm0gWzFdIGZvciBleGFtcGxlLCB3aXRob3V0IHRoaXMgcGF0Y2gsCj4g
UmVtb3Zpbmcgc3BhY2VtaXRfcG1fZG9tYWlucyBtb2R1bGUgd2lsbCB0cmlnZ2VyIGEgZmFpbHVy
ZSB0bwo+IHJlbW92ZSBwb3dlciBkb21haW4sIGFjY2VzcyBwbV9nZW5wZF9zdW1tYXJ5IHdpbGwg
cmVzdWx0IGFuCj4ga2VybmVsIG9vcHMsIFNlZSBkZXRhaWwgbG9nIGJlbG93Cj4KPiBkb21haW4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyAgICAgICAgICBjaGlsZHJlbiAgICAgICAg
cGVyZm9ybWFuY2UKPiAgICAgL2RldmljZSAgICAgICAgICAgICAgICAgICAgICAgICBydW50aW1l
IHN0YXR1cyAgICAgICAgICAgICAgICAgIG1hbmFnZWQgYnkKPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBsY2QxICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9uICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMAo+ICAgICBjYWM4ODAwMC5kcCAgICAgICAgICAgICAgICAgICAgIHVuc3Vw
cG9ydGVkICAgICAgICAgICAgICAgICAwICAgICAgICAgICBTVwo+IGxjZDAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb2ZmLTAgICAgICAgICAgICAgICAgICAgICAgICAgICAwCj4gYXVkaW8g
ICAgICAgICAgICAgICAgICAgICAgICAgICBvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDAKPiBncHUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9uICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMAo+ICAgICBjYWMwMDAwMC5ncHUgICAgICAgICAgICAgICAgICAgIGFjdGl2
ZSAgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAgICBTVwo+IHZwdSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb2ZmLTAgICAgICAgICAgICAgICAgICAgICAgICAgICAwCj4KPiBncHUg
IGxjZDEgIHBtX2dlbnBkX3N1bW1hcnkKPgo+IChncHUgYW5kIGxjZDEgaXNuJ3QgY2xlYW4gdXAp
Cj4KPiBbICAxODEuMzUzNjcxXSBzcGFjZW1pdF9wbV9kb21haW5zIHNwYWNlbWl0X2NjdS5rMy1h
cG11LXBtZG9tYWluLjM6IGZhaWxlZCB0byByZW1vdmUgZG9tYWluIGdwdTogLTE2IC0gc3RhdGUg
bWF5IGJlIGluY29uc2lzdGVudAo+IFsgIDE4MS4zNTM4ODldIFBNOiBnZW5wZF9yZW1vdmU6IHVu
YWJsZSB0byByZW1vdmUgbGNkMQo+IFsgIDE4MS4zNTM4OTZdIHNwYWNlbWl0X3BtX2RvbWFpbnMg
c3BhY2VtaXRfY2N1LmszLWFwbXUtcG1kb21haW4uMzogZmFpbGVkIHRvIHJlbW92ZSBkb21haW4g
bGNkMTogLTE2IC0gc3RhdGUgbWF5IGJlIGluY29uc2lzdGVudAo+Cj4gWyAgMjA2LjIyODA0NV0g
Q1BVOiA1IFVJRDogMCBQSUQ6IDI1NjAgQ29tbTogY2F0IE5vdCB0YWludGVkIDcuMy4wLXJjMTIg
IzgxIFBSRUVNUFRMQVpZCj4gWyAgMjA2LjIzODAwMl0gSGFyZHdhcmUgbmFtZTogU3BhY2VtaVQg
SzMgUGljby1JVFggKERUKQo+IFsgIDIwNi4yNDMwMjddIGVwYyA6IHN1bW1hcnlfc2hvdysweGFh
LzB4MzA4Cj4gWyAgMjA2LjI0NzA4MV0gIHJhIDogc3VtbWFyeV9zaG93KzB4MjY0LzB4MzA4Cj4g
WyAgMjA2LjI1MTIyNF0gZXBjIDogZmZmZmZmZmY4MDlmNTBmYSByYSA6IGZmZmZmZmZmODA5ZjUy
YjQgc3AgOiBmZmZmZmZjNjAxMjczYTgwCj4gWyAgMjA2LjI1ODU0Ml0gIGdwIDogZmZmZmZmZmY4
MjMzM2I5OCB0cCA6IGZmZmZmZmQ2MDFkNWVjODAgdDAgOiBmZmZmZmZmZjgwMDI2YjM4Cj4gWyAg
MjA2LjI2NTg1OV0gIHQxIDogZmZmZmZmZDYwOTJkM2NiMCB0MiA6IGZmZmZmZmZmODE2MDE4MTAg
czAgOiBmZmZmZmZjNjAxMjczYjEwCj4gWyAgMjA2LjI3MzE3N10gIHMxIDogZmZmZmZmZDYwMWI5
MjQ3MCBhMCA6IGZmZmZmZmQ2MDFiOTI1ODggYTEgOiAwMDAwMDAwMDAwMDAwMDBhCj4gWyAgMjA2
LjI4MDQ5NF0gIGEyIDogZmZmZmZmZDYwOWFlODAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQg
OiBmZmZmZmZkNjAxZDVlYzgwCj4gWyAgMjA2LjI4NzgxMV0gIGE1IDogMDAwMDAwMDAwMDAwMDAw
MCBhNiA6IGZmZmZmZmZmZmZmZmUwMDAgYTcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgMjA2LjI5
NTEyOF0gIHMyIDogZmZmZmZmZDYwOTJkM2NiMCBzMyA6IGZmZmZmZmQ2MDFiOTI0NzAgczQgOiBm
ZmZmZmZkNjAxYjk0MDQwCj4gWyAgMjA2LjMwMjQ0N10gIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBz
NiA6IDAwMDAwMDAwMDAwMDAwMDMgczcgOiBmZmZmZmZmZjgyMjFlM2E4Cj4gWyAgMjA2LjMwOTc2
NF0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMSBzOSA6IGZmZmZmZmZmODE3MmI4YzggczEwOiAwMDAw
MDAwMDAwMDAwMDA0Cj4gWyAgMjA2LjMxNzA4Ml0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6
IDAwMDAwMDAwMDAwMDAxN2EgdDQgOiAwMDAwMDAwMDAwMDAwMDAyCj4gWyAgMjA2LjMyNDM5OV0g
IHQ1IDogMDAwMDAwMDAwMDAwMDAwMCB0NiA6IGZmZmZmZmQ2MDlhZTcxNzggc3NwIDogMDAwMDAw
MDAwMDAwMDAwMAo+IFsgIDIwNi4zMzE4MDRdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRh
ZGRyOiAwMDAwMDAwMDAwMDAwMDEwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4gWyAgMjA2LjMz
OTgyOV0gWzxmZmZmZmZmZjgwOWY1MGZhPl0gc3VtbWFyeV9zaG93KzB4YWEvMHgzMDgKPiBbICAy
MDYuMzQ1MjA2XSBbPGZmZmZmZmZmODA0YjY3Zjg+XSBzZXFfcmVhZF9pdGVyKzB4ZTAvMHgzOTAK
PiBbICAyMDYuMzUwNjcxXSBbPGZmZmZmZmZmODA0YjZiODY+XSBzZXFfcmVhZCsweGRlLzB4MTU4
Cj4gWyAgMjA2LjM1NTY5N10gWzxmZmZmZmZmZjgwNjNkZWU0Pl0gZnVsbF9wcm94eV9yZWFkKzB4
NTQvMHg4OAo+IFsgIDIwNi4zNjEyNTBdIFs8ZmZmZmZmZmY4MDQ3YTAzZT5dIHZmc19yZWFkKzB4
YWUvMHgzODAKPiBbICAyMDYuMzY2Mjc1XSBbPGZmZmZmZmZmODA0N2FkYzI+XSBrc3lzX3JlYWQr
MHg2YS8weGYwCj4gWyAgMjA2LjM3MTMwMV0gWzxmZmZmZmZmZjgwNDdhZTY4Pl0gX19yaXNjdl9z
eXNfcmVhZCsweDIwLzB4MzAKPiBbICAyMDYuMzc2OTQ0XSBbPGZmZmZmZmZmODEwMWZhNmE+XSBk
b190cmFwX2VjYWxsX3UrMHgxOWEvMHg1MTgKPiBbICAyMDYuMzgyNjc0XSBbPGZmZmZmZmZmODEw
MzNhY2M+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTZjLzB4MTc4Cj4gWyAgMjA2LjM4ODUwM10gQ29k
ZTogMGExMyBjMDBhIDRjMDUgNGIwZCAzNzgzIDU0MGEgMzgyMyBmODA0IDM0MjMgZjgwNCAoNmI5
YykgODU1Mgo+IFsgIDIwNi4zOTYwNTBdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAg
XS0tLQo+IFNlZ21lbnRhdGlvbiBmYXVsdCAgICAgICAgIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9w
bV9nZW5wZC9wbV9nZW5wZF9zdW1tYXJ5Cj4KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Pgo+IFdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBlaXRoZXIgdW5sb2FkIHRoZSBtb2R1bGUgb3Ig
dHJpZ2dlciBhbgo+IHVuYmluZCBvcGVyYXRpb24sIHRoZSBkb3duc3RyZWFtIGdwdSwgbGNkMSB3
aWxsIGV4aXQgZ3JhY2VmdWxseQo+Cj4gb3IKPgo+IGRvbWFpbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzICAgICAgICAgIGNoaWxkcmVuICAgICAgICBwZXJmb3JtYW5jZQo+ICAgICAv
ZGV2aWNlICAgICAgICAgICAgICAgICAgICAgICAgIHJ1bnRpbWUgc3RhdHVzICAgICAgICAgICAg
ICAgICAgbWFuYWdlZCBieQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gTGluazogaHR0cHM6
Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYxMTA4LTA0LWszLXBtLXN1cHBvcnQtdjMtMC1iOWRjMDg1
NzAzOWJAa2VybmVsLm9yZyBbMV0KPiAtLS0KPiAgZHJpdmVycy9wbWRvbWFpbi9jb3JlLmMgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BtZG9tYWluL2NvcmUuYyBiL2RyaXZlcnMvcG1kb21haW4vY29yZS5jCj4gaW5kZXgg
OTY0ZTQ0YzJmNzhmLi44NzBmYzgwODNiY2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wbWRvbWFp
bi9jb3JlLmMKPiArKysgYi9kcml2ZXJzL3BtZG9tYWluL2NvcmUuYwo+IEBAIC0zNTQzLDYgKzM1
NDMsOCBAQCBzdGF0aWMgaW50IF9fZ2VucGRfZGV2X3BtX2F0dGFjaChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKmJhc2VfZGV2LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVQ
Uk9CRV9ERUZFUjsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgZGV2aWNlX2xpbmtfYWRkKGRldiwg
JnBkLT5kZXYsIERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUik7Cj4gKwo+ICAgICAgICAgcmV0
dXJuIDE7Cj4KPiAgZXJyOgo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDY2MjhlN2Q0YzZiMjVjOGQx
OGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQKPiBjaGFuZ2UtaWQ6IDIwMjYxMTEyLTAxLXBtLWRldmlj
ZS1saW5rLTlmZGQwZmU1OWE0OQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
