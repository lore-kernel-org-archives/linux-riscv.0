Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FBFCD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtKPH+2LaLXJInq+b+b4q6pMxFvRyoUn56Rpihjuivg=; b=w2UpDzhzc1pvNy
	fb27ojc3sXHGWfc4v5tKzTyoU28HN96J78MvLZq6zOanUzhWR2lp9iXOF/lGEApqB62PLgpvmMWrC
	ACWLdyW5XWWIaIawMKjP26aj9yoXeUXD+3N/ZyWRSkYrwsIUtwqJ98bGHSKPseHq7TSA7LCRDChk4
	vMB47gjINWDvgZmjrJDaTunN51H49MlaOD/YpnZrlT5FK7jC2RL0HQgz6cZakG6olSxH+NtxODw29
	HlD+7YLAvmzSUp3bp9B6eNG5z7GFKfrELhN6zEPb5YqkKAI8Q8sEe2ALUCnElMPktYu5elTnXe6vp
	tdxnTNOXWhwv4EkkCRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPKz-0000000AsN3-0rH7;
	Fri, 22 May 2026 12:50:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPKw-0000000AsMI-3ANb
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 12:50:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIidq1800723
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 12:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=; b=mXls+qtXCZljlfkr
	7YpD1hKAiWwM+Ee2Q5AG4oUA9GRJnOtlK8EqTOgD9gdEvq9MgoyTbp2xEMfTG3mm
	1d+lTUZYyUikwVJ1x2SPYDiuCrVH+7UveQPMJ8i42kS2XR04D96K/8FyqxaGsagw
	U3NFJ57iz66hiO32GT71UhGGoFxswXfGyaEQyB80wvdPer176nO0h350YSGh6AVJ
	J++k0z2gwr7BoaWibi3JY9XmuyV7wy/EcJWL9NMR31c1HouSOlURy1yxe+Mv6bDL
	XLgvEONbC9whtem7wg4zobbvrq/BanhmJI5ICWVKx59wxGoRBtauFtQ7Yi362u16
	Qb0R0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0g2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 12:50:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3041ab826ddso5054497eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454245; x=1780059045; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=;
        b=LXIMOAn9q/s5jGCzbOuiECudlZMqYEhV4LKVqoYbfN0qk/wPp/BsQf0cP/4p5Jrug3
         SNfmPZiMlT+9DCB0Zjob+a3Enf0G3mN9FayM4HF+g3RDl2o+eMHDDSmgEY0b1x/V9Yv2
         Zj+pvuI8OCZwi6YdwyQthz/VybLAFFq4TBuxN01RVt2hsUlmSaFpYn8rcz79qn4e9KMS
         YXCOEoMbaJ8tAAHL9/xp2zLjqhUco0ROPEWqs9dQS1K635zHKzKzPYHSI7AI/s+zJR9c
         V8zl4U5E7fxCeBqZRqWXkl2xqWXe/MdGq/WHLVYzpeFF94B0g5OSvSRPOxCL9V0nWu/j
         LDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454245; x=1780059045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=;
        b=iRdvgtKc6l805EkvDsrcEwiFQAfgmcEATJoRAosc0TVsB9mC3vWKJA7Q9uFbGmvGp9
         X7MlBBtgW3dePW8A57ZIPHNLoFD55ql/r9gwzmt8C7AZ034OgyBxKfr6sHRE/24rt46M
         uzlJyrvR2TT5ImCLfj/uPXUgqJibKxeK/aiStWscuVVwJsvKJK3B4C+kHJ+YspD+rl32
         Gh7F1yBlInQ8GdumYCN0sHmtugHIlR5Q1iacsdh5K3t+xCY+ALFtdBbHfS4RWvGtDPKN
         wzM6Lj+gtUzqbxlDMYwPnrEWfb1zxFEu4NQHT63RDYQlDwKO/bNgQCqco7EG4aI8SFQg
         jQZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aSaMRIGowCi0HwgoHuOTt8kVUwjqqmnNt6EjY4Hs+v5xt00asbqLsUMzAzaoYlalq35OoG6LzokLAiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE0xq6/YkIo9vaQp9i2qmNVACqkEQvLKiD3gMAyw6I3OLAjgNF
	xOSYkSGwm2apYJ8IXjkUwlkmZlD/g/7ieP35HR5jD0aHl+vaCLGGpwIokUWh8ayZAN62pNNZqdA
	FT+XQmBdXL8c4C3xCCmlRHsJYODDL/rDJSEJ24gOWymIaZlIKhhCtWzOY+CCJUBDaR5JkC74=
X-Gm-Gg: Acq92OGlu+9Kgv9tlNhXCB59p+EU78jvmCvc2F2/SvZ2EAcfqazA+GrzFcGn8cnsWK6
	O7BHpyZ3fykXSSErRQp5eciQx1n2sr29xQfYEQ5Ii0Vxw1FdXs7zvvOfzbCgHG+XxVYq9xMXw8h
	qzIIXyZe3d31SXnMLfq9W6DG/CT5rg1fyuvW+iQ9Nu24JAE3AeO1RrMWUcOFfIW3qZ0hbTt125s
	OwSoDxgUotQ1uDpyk8+OCHauuZRy6AjTORk0rXmtQFaLN66JmPDv1p3a+XLP1SQjJopWJ5JlZbm
	OZi7cHoJownt4ZTxS3KvZhQdJbNvQiQ1iXFYsynCNnwASDihqdfBDNMjVOG03m8DWdZjCndW4LZ
	x6FUjugonD4C3BMVygrcoyH5dcXnztwKy24q2XLJkmw==
X-Received: by 2002:a05:7301:6007:b0:2f2:5726:db31 with SMTP id 5a478bee46e88-3044913a03fmr1905502eec.35.1779454245482;
        Fri, 22 May 2026 05:50:45 -0700 (PDT)
X-Received: by 2002:a05:7301:6007:b0:2f2:5726:db31 with SMTP id 5a478bee46e88-3044913a03fmr1905472eec.35.1779454244912;
        Fri, 22 May 2026 05:50:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230dddsm1100812eec.17.2026.05.22.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:50:44 -0700 (PDT)
Date: Fri, 22 May 2026 07:50:43 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <y2nfuwydbx4wxk3optxr5bex2pubo5whqvk2bzsl7os2kdkwaq@yk36oa4kozfh>
References: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
 <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: G-RwAc0Ja4_6BGz7xt6WqRgV5hviqQCg
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a105126 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=dx1DtnK-AAMJs4xixqwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: G-RwAc0Ja4_6BGz7xt6WqRgV5hviqQCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX7l7cVKGxKF0n
 CgGRPkdUrsUfNVFD02cd//gouLksUvJ9M/BoQhrInO/DLio53++o7blVOxbXE88/e8BqKr3KsuV
 gKZzzolw35Mrc0k1P6CRBqr8U1WjZXT/Go4jayNSR49Wovgyyp3B0tBuAHf6TTj+r3PjImRC8Km
 mCMeQIjibavn8kZxNjUvjPjAuT0d5GJNgjtNwrZ0S4bBjbSv7nD8NRUAmT5eEMXreiUZHf4gQxY
 DHkULROniiYrMhYQY6z0dunl7/jR6xSOM39D6QH9Y5ogjHG8Ta8JpWxZ9imSh2nGFd5Xez0rlQZ
 G/ST+/FL2L36GF+BcrJytvFKg9ztfTj5JQkq5s+7knwP79gWItfCIvl/upF5b0um9mYV5NIUL2C
 LABuodC+dCYPO0l7C9CvD6vf2z3yj30D1X1vSLh1HRzKkxGMnU2nD1AJmc6dA/pkg/VHzmxd8pW
 uqtGtNLymlbRetZZqTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_055046_794723_316F86F1 
X-CRM114-Status: GOOD (  18.21  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDM6MTg6MTNBTSArMDAwMCwgSmlha2FpIFh1IHdyb3Rl
Ogo+IEhpLCBkcmV3IQo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXchCj4gCj4gPiA+IEknbSBu
b3QgYSBiaWcgZmFuIG9mIHRoaXMgYXBwcm9hY2ggYW5kIEkgc2VlIHNhc2hpa28gZm91bmQgaXQg
aGFzIGdhcHNbMV0uCj4gCj4gSSByZWFkIHNhc2hpa28ncyBmZWVkYmFjayBhbmQgSSB0aGluayBp
dCBtYWtlcyBzZW5zZS4KPiAKPiA+ID4gSSdkIHJhdGhlciB3ZSBpbnRyb2R1Y2UgYSBtdXRleCB0
byBrdm1fYXJjaCB0byBzZXJpYWxpemUgY3Jvc3MtdmNwdQo+ID4gCj4gPiBFaCwgbm90IHN1cmUg
d2h5IEkgc2FpZCAnaW50cm9kdWNlJyBoZXJlLiBXZSBjYW4ganVzdCB1c2Uga3ZtLT5sb2NrLgo+
IAo+IEkgbG9va2VkIGludG8gdGhhdCwgYnV0IGl0IG1heSBiZSBub3Qgc3VpdGFibGUuIEhlcmUn
cyB3aHk6Cj4gCj4gRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9sb2NraW5nLnJzdCBleHBsaWNpdGx5
IHN0YXRlczoga3ZtLT5sb2NrIGlzIHRha2VuIAo+IG91dHNpZGUgdmNwdS0+bXV0ZXguIFRoZSBz
dXNwIGhhbmRsZXIgcnVucyBpbnNpZGUga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oKSwgCj4gd2hp
Y2ggaXMgY2FsbGVkIGZyb20ga3ZtX3ZjcHVfaW9jdGwoKSB3aGVyZSB2Y3B1LT5tdXRleCBpcyBh
bHJlYWR5IGhlbGQuCj4gCj4gVGFraW5nIGt2bS0+bG9jayBpbnNpZGUgdGhlIHN1c3AgaGFuZGxl
ciB3b3VsZCBwcm9kdWNlOiB2Y3B1LT5tdXRleCDihpIga3ZtLT5sb2NrLgo+IFNvIG1heSBiZSB3
ZSBzaG91bGQgaW50cm9kdWNlIGEgbXV0ZXggdG8ga3ZtX2FyY2ggdG8gc2VyaWFsaXplIGNyb3Nz
LXZjcHUKPiBtcC1zdGF0ZSBvcGVyYXRpb25zLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwoKR29v
ZCBjYXRjaC4gSSBzaG91bGQgaGF2ZSB0cnVzdGVkIG15IGluaXRpYWwgaW5zdGluY3RzIHRvIGlu
dHJvZHVjZSBhIG5ldwptdXRleCA6LSkKClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
