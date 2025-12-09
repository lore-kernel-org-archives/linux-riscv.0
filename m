Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB87D1CDC6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 03:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnGHBEW+PdgEdPVxyDPaBrQw9oL4qejJ3FSw/hDB9Hk=; b=45VuGjkB5psNva
	0VPdtRHWb3uhudpABNgzQRxe4FQf6htn81Fl+palzjpRUG/m6FfQDQYhQjpJW6YidecZ1Bz6/fvoJ
	oouH9n4PyT6/Oiak+OkoKLFMVuSvLBQGQrGbVnpfzabJYgAEiL03H9CBFlJR97Hj0uP58+5lodqoZ
	ma5iPoBF3s0O8DqpgIFwiSAo6J/oi3v/VcZepeHmFVcpeWupLIQromXoLO+vX4USgDNXjAgLbZtwf
	KULRm9S5Xw+px2lTw5vkGii9i/6JW52ZbPV1St2m2VM6Xfvpe4PmDZol5Mlctumh6Yiou2SOvf/DG
	NhicJRP23DSBQ+Pi1MTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSonv-0000000DmWp-2Jn7;
	Tue, 09 Dec 2025 03:54:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSons-0000000DmWR-2iZN
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 03:54:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXCd81853434
	for <linux-riscv@lists.infradead.org>; Tue, 9 Dec 2025 03:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnR1xWyFVLfFlT3ZIJffxXiMjmUP6mdMumapN+NQlmA=; b=QVIFV7joPgay0TbZ
	oD4cJET1Go0l1Y8+OeGfQvBXa8WGPkK/z66uNrTiSCJNX0rC2ykidA4gvJB6vQcK
	UyOWr1xSMNLQnnAhadUOvejc0T/0+N0r/LDNOv9DZtl8hfCIU93G7o1YAGP76OrW
	Rsqcn3zoLtlfQ1NQKHHyMDgwqkHpJgjz0AeOa49FrJ1cs7hmn/UdL8mzyDPCOm6v
	hI0nTyRXa72hhEXaLvC9kxqrWc01ZXOBJWeMKURoO7+uk1zJ4jNm1ApQn2o+sPIx
	sNb3bPLroOwark0WZZyCOQfAguh8jOT72vMqiAc5y5BAbYMhBVhCsutxBUrvY0UL
	bj7okg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax63v8xs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Dec 2025 03:54:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso4387233a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 19:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765252458; x=1765857258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nnR1xWyFVLfFlT3ZIJffxXiMjmUP6mdMumapN+NQlmA=;
        b=UcnGqgyYml7QJhvuTzItOAcTGH9UBTHOBjk6uUuL0A0iJZRiRX56bAGV0k++lc/0le
         Ht62h32ipYWqMhxNaH4/AXrYhJXV7/DjV4DcfetaRXZfRPOJ0OG1MFg946OkadbKNBMG
         hN258rmVzsR6mnkRzZWZ7RZ7G1K/NOx2JHZ0hVHStuic2JN1Od+W9hteZL0ghdAAHYnf
         O0rXTmCEh62V5zhaaavEfedi0E5jt3bAj5AyXIlk0ayH6JPQZvPIKaU8sZs0fM9rHnGR
         r155aoGucfq9fQSVc5yRzE5xN4IjhtrNCaW15p6czHd1Dhnb3dtQPL5z/uQ7ruyYMvEo
         RBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765252458; x=1765857258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnR1xWyFVLfFlT3ZIJffxXiMjmUP6mdMumapN+NQlmA=;
        b=iK59S2heqKeK6qw4qVr0oNQ+c0eXiIG2VeKN1ZwiNtNuwoGlLU253dM2nkHFls6XKV
         tVYWSakhVKdVhte1JD96iVq+Ypd4yEjZOpHClPyrRP1xF9FopMKbM7a6zMEaZqV5ZYFa
         kXxJJ9ZjdDGEZBVdFE00GxuUlAvgVJqbcZY9GsUXDMomI1EP2x5771AvBCfft5vJ2bVu
         CmOimihe/Aq8qVKl63Q3sOxydBfICptUEoubKnbEF29PHCHbrbRXL3uvTALdfXu/cFhi
         Rzo3e25613LLl3JdFhmm6FytyEG4mjYivLoiMj6Z8Mk5IAbZn+HvSDdnd48K2QbKGZX8
         Awsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJk1eua+8f2mJZPvfTRXV1vNOW4vK/hyuRgJjIjla3Ekn6mtoLSNt3NKM9QftTGhigy/BDsOBmE5yIbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFV0A0FN+wUgbQJsRAHrIitspoGTKuuTMz2sG3E4HcxbyC0kU1
	BQEJ7FA6isaSlIpCQgiHEUVqJhm5nwSuPxH0Jcfpl2fTwmanOlbD+CRGQsyCzaDqYm/ZbrGs7QD
	VfyDfHwppOYcX0krwBuqpPiUBht4tHeqv5MKM71vjjG2XwaK8qooC4Nj0UBJ1DbLhgnQt+w==
X-Gm-Gg: ASbGncsaW0gNtChK9iFwMlVehx6xyuEt8NDtndQUWmLhFU8IgtF4nT6f3qlsvFzn1+Q
	jFhcxtfWxXRiEtUGfZN1KPVqMfCbtgRNMULw6adqcms7I6yCXjnmWkjUJPyCJvgXgLcrEZ64AbP
	9olnQuvMHCRT67hIiiqpqYeQ7KTn9JbncGhAujBFnKTPi8rI2PHO2s+A0skD9myOO49Nb9pshs0
	ohTyKBRrZnsJseQjenJ2PHRmJRdWv1K6LD7lIz60RApfwDypWa2WNh+35GV1lhv95z9SHqLxCP8
	JDbJdGU1a7aCILm++I1deM33bGLEFmfzJlYxxLy2dMYw9DjJPFXqm17SDBFl2zRa+nokH3ZceAH
	8QDeO6R5U7E57b5SL7H5HTx3tv8V1Xk+944LUzAx2urbvnesPuKyLPtrhl7axVXASzMOCSgoqqH
	ZXr4EsuT0=
X-Received: by 2002:a17:90a:fc47:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-349a267fbc8mr8392232a91.21.1765252458455;
        Mon, 08 Dec 2025 19:54:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBtCRRfRZPsiM51E+rJcLK4CAWy+MDqSOd14fLOVvOPDgFDBD4Poe8H4k0y2eRJlIFNllCOA==
X-Received: by 2002:a17:90a:fc47:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-349a267fbc8mr8392201a91.21.1765252457977;
        Mon, 08 Dec 2025 19:54:17 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a48dd5229sm747017a91.0.2025.12.08.19.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 19:54:17 -0800 (PST)
Message-ID: <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 14:54:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
 <aTbCqyOuprPOyU4X@sumit-X1>
 <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dKarWeZb c=1 sm=1 tr=0 ts=69379d6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PgFiUajCvCRNKxe-32EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aZyoOZo-troQh0oDytoJGE7o3AwqvjeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAyNyBTYWx0ZWRfXw03sCSeZYmAq
 I+HztrLI+ni1f8APaL+txAcwLyU/m3IO5z17bTxOqRDoWJ+30OG+dO0vOlPO+BXGrZvSPMWHkNO
 PBIu+iE/pyw6mai8i3zoA7ieIQ2cslFKnrdc/D+T9qOvehVJRGlfZGgobCX8rs7LCqXQm7vWRXS
 HnNherBe4+mqSuj5FDPslkqJEhLQlbqVo0GyUkgxaANvqEVqyh80EnkZBEC8V9EoP3NnLt8F9BS
 +zzMjfGMSj4f9qjGJ0Ndia5Lx8l4YGDXXSApi1r7HHJAc/pvyv+1qO9U9O43mJbjgceVLL/8t4a
 GFe/wqrS47HahjKizqLkpzdNsyjStWC+trcKphNGg7ff9BNheDb+Je9YRMc06AOoDNkOqR/QUD1
 ZRqYUIJyYjbF0p0n/5GgPSI+QJrZ/w==
X-Proofpoint-GUID: aZyoOZo-troQh0oDytoJGE7o3AwqvjeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_195420_884239_8CAA99D6 
X-CRM114-Status: GOOD (  22.34  )
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

SGksCgpPbiAxMi84LzIwMjUgMTE6NTQgUE0sIEhhcnNoYWwgRGV2IHdyb3RlOgo+IAo+IAo+IE9u
IDEyLzgvMjAyNSA1OjUwIFBNLCBTdW1pdCBHYXJnIHZpYSBPUC1URUUgd3JvdGU6Cj4+IE9uIE1v
biwgRGVjIDA4LCAyMDI1IGF0IDA0OjI0OjE3UE0gKzExMDAsIEFtaXJyZXphIFphcnJhYmkgd3Jv
dGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxMi81LzIwMjUgMTI6MjcgQU0sIEplbnMgV2lrbGFuZGVy
IHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMToxN+KA
r0FNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEZy
b206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+Pj4+Cj4+Pj4+IFRoZSB0ZWVfaW9j
dGxfb2JqZWN0X2ludm9rZV9hcmcgc3RydWN0dXJlIGhhcyBwYWRkaW5nIG9uIHNvbWUKPj4+Pj4g
YXJjaGl0ZWN0dXJlcyBidXQgbm90IG9uIHg4Ni0zMiBhbmQgYSBmZXcgb3RoZXJzOgo+Pj4+Pgo+
Pj4+PiBpbmNsdWRlL2xpbnV4L3RlZS5oOjQ3NDozMjogZXJyb3I6IHBhZGRpbmcgc3RydWN0IHRv
IGFsaWduICdwYXJhbXMnIFstV2Vycm9yPXBhZGRlZF0KPj4+Pj4KPj4+Pj4gSSBleHBlY3QgdGhh
dCBhbGwgY3VycmVudCB1c2VycyBvZiB0aGlzIGFyZSBvbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG8K
Pj4+Pj4gaGF2ZSBpbXBsaWNpdCBwYWRkaW5nIGhlcmUgKGFybTY0LCBhcm0sIHg4NiwgcmlzY3Yp
LCBzbyBtYWtlIHRoZSBwYWRkaW5nCj4+Pj4+IGV4cGxpY2l0IGluIG9yZGVyIHRvIGF2b2lkIHN1
cnByaXNlcyBpZiB0aGlzIGxhdGVyIGdldHMgdXNlZCBlbHNld2hlcmUuCj4+Pj4+Cj4+Pj4+IEZp
eGVzOiBkNWI4YjBmYTE3NzUgKCJ0ZWU6IGFkZCBURUVfSU9DVExfUEFSQU1fQVRUUl9UWVBFX09C
SlJFRiIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4+Pj4+IC0tLQo+Pj4+PiBUaGUgbmV3IGludGVyZmFjZSBzaG93ZWQgdXAgaW4gNi4xOCwgYnV0
IEkgb25seSBjYW1lIGFjcm9zcyB0aGlzIGFmdGVyCj4+Pj4+IHRoYXQgd2FzIHJlbGVhc2VkLiBD
aGFuZ2luZyBpdCBub3cgaXMgdGVjaG5pY2FsbHkgYW4gQUJJIGNoYW5nZSBvbgo+Pj4+PiBhcmNo
aXRlY3R1cmVzIHdpdGggdW51c3VhbCBwYWRkaW5nIHJ1bGVzLCBzbyBwbGVhc2UgY29uc2lkZXIg
Y2FyZWZ1bGx5Cj4+Pj4+IHdoZXRoZXIgd2Ugd2FudCB0byBkbyBpdCB0aGlzIHdheSBvciBub3Qu
Cj4+Pj4+Cj4+Pj4+IFdvcmtpbmcgYXJvdW5kIHRoZSBBQkkgZGlmZmVyZW5jZXMgd2l0aG91dCBh
biBBQkkgY2hhbmdlIGlzIHBvc3NpYmxlLAo+Pj4+PiBidXQgYWRkcyBhIGxvdCBvZiBjb21wbGV4
aXR5IGZvciBjb21wYXQgaGFuZGxpbmcuCj4+Pj4KPj4+PiBUaGlzIGlzIGN1cnJlbnRseSBvbmx5
IHVzZWQgYnkgdGhlIHJlY2VudGx5IGludHJvZHVjZWQgcWNvbXRlZSBiYWNrZW5kCj4+Pj4gZHJp
dmVyLiBTbyBpdCdzIG9ubHkgdXNlZCBvbiBhIGZldyBhcm02NCBRdWFsY29tbSBwbGF0Zm9ybXMg
cmlnaHQgbm93Lgo+Pj4+Cj4+Pj4gSSB0aGluayB3ZSBzaG91bGQgdGFrZSB0aGlzIHBhdGNoLCBi
dXQgbGV0J3MgaGVhciB3aGF0IG90aGVycyB0aGluay4KPj4KPj4gWWVhaCBzaW5jZSBpdCdzIG5v
dCBhbiBBQkkgaXNzdWUgb24gYXJtNjQgcGxhdGZvcm1zIHdoZXJlIFFURUUgcnVucywgc286Cj4+
Cj4+IFJldmlld2VkLWJ5OiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQG9zcy5xdWFsY29tbS5jb20+
Cj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gSmVucwo+Pj4+Cj4+Pgo+Pj4gSSBhZ3JlZS4gV2Ug
c2hvdWxkIHRha2UgdGhpcyBwYXRjaC4gQXMgbm90ZWQsIHRoZXJlIGFyZSBub3QgbWFueQo+Pj4g
Y2xpZW50cyByZWx5aW5nIG9uIGl0IHlldCwgc28gdXBkYXRpbmcgdGhlIHVzZXJzcGFjZSBzaG91
bGQKPj4+IGJlIHN0cmFpZ2h0Zm9yd2FyZC4KPj4KPj4gWW91IHNob3VsZCByYXRoZXIgdGVzdCB3
aXRob3V0IGFueSB1c2Vyc3BhY2UgbGlicmFyeSB1cGRhdGUgdG8gdGVzdCBpdCdzCj4+IG5vdCBh
biBBQkkgaXNzdWUuIEp1c3QgZm9yIGNvcnJlY3RuZXNzIHNha2UsIHlvdSBjYW4gdXBkYXRlIHRo
ZSBsaWJyYXJ5Cj4+IHRvby4KPj4KPiAKPiBJJ2xsIHRha2UgdGhlIHRpbWUgdG8gdGVzdCBpdCBh
dCBzb21lIHBvaW50IHRoaXMgd2VlayBib3RoIHdpdGggYW5kIHdpdGhvdXQgdXBkYXRpbmcKPiB0
aGUgbGlicmFyeSBBQkkuCj4gCgpTdW1taXQsIHRoYXQgd2FzIHRoZSBwbGFuIGZyb20gdGhlIGJl
Z2lubmluZywgdGhhdCdzIHdoeSBJIGRpZCBub3QgYWRkICJSZXZpZXdlZC1ieToiCmluIHRoZSBm
aXJzdCBwbGFjZS4gVGhhbmtzIEhhcnNoYWwgZm9yIHZvbHVudGVlcmluZy4KCkJlc3QgcmVnYXJk
cywKQW1pcgoKPiBSZWdhcmRzLAo+IEhhcnNoYWwKPiAKPj4gLVN1bWl0Cj4+Cj4+IFsuLi5dCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
