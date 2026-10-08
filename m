Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961A2CA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REd/A+2vDmuijOLmVr0tSJ+9liNFas7NBLj2InG8jbM=; b=sTH5q6KSecq2Sp
	s83xNn9i0F8W7E5uuuzyI7jCi5+ALW5QpNMlwi++76n6ZTA1poduKmhlYcqxGkebIs5kGMeANFJhh
	ik/j0TbMtDhC/YI0H9vS7vT1w34yYiN+LYWuXl1XdNlneldu8n6YxZKzGgTPeOh8pqnmyKV2kFPCi
	TiQPwKAVq0H/pQ2JJMQWt8Xp1LAfdkLzLCVsne03XFW9VuPjVI2S6qoLMcVq+eoLd4iJ1/wfTTSXf
	CKf8Mfhmo1ThNnfIMJ9nWBSiLeDxpuZC3BE5DyaTaOIqDdxFN72lwIXjD0VUEZfWbDh5X/eFHZxxc
	4OmRBhexfSLoNa8c1lmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjE9-00000003prY-3hmf;
	Thu, 08 Oct 2026 08:11:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjE7-00000003pr8-19RT
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 08:11:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOP01846063
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 08:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=; b=lvENMn6WoMDZJeJH
	01RdZR9gO8z+f/cXd2he/jnQUB2R8Xqeb3nw4iaPPwOttG3a26yJqZCpdD3uhOsG
	9dv454H28YeDbtIDbJNw6vmfZe4Pp5/SWvOyXQv2DddRCN/p72q60CHRngiL0nm0
	HB7i3KeAdrgd16ZFXWONK4Hegqyx/Y7hBTujduBGtoQ+dcdHkZDg1pfJ5EOtEV2W
	4j/FDmq0kxszm3QUrral1g168QvpxlWcIOeqN0QaNOVDJnoEii9Q+ZI7XqOIN/XR
	xK8GVS0+tg/72OYeqfInTymZIClV2yHOpJiJyt5ruO+0LNj3iymWfDmUjuakz/3j
	Scwa8g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hxwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 08:11:41 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ae7fb98d59so49477577b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 01:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791447101; cv=none;
        d=google.com; s=arc-20260327;
        b=j+B9RA9cP+RrlemJGMCIu2D6xQs6I5KydafuDvnCJZyXKDaDFO6P1AMsALIAyvZknC
         yoPRw2rsTS7fPxj7WEsdNmWk7ndzbqRI+QuxRfnSZuBGI5TtQIcnbWsNHEI0xjExCW0P
         ogROyQH2Z/jlC/qLKMN/+/1B8qIvjr7vYSbBytMo4hZ5eZ3ievwuZDhk7gGc3vH7JAyB
         wgZdtG6bsLJGsYh5fxe4HpWZTA9n7YT9QUu2VIxGxZafGKUi2GINrApa6c/LRa6WA8mJ
         QYN2KpzwU61kp3OrgffY6IN/EoBu/HX6qs1QEO/0k15gcie6u8ec93d9M1J2i0MbR/m/
         h70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        fh=1B5VmQf4sCvvczn+YEMD8hJyoJS/W5nUadAzDfIVPqA=;
        b=i2RHb2fisBfB7h6SXdqyC5x5sNgkEmsU6Q8GFY8rrt181QwtlT57+8GhM3jST5hani
         3eHaWOwuvsMvmnu/Yno+OUzo76yjppzAVsygY7ca5VlMxXMIt+iNoRNhSOuz53gRnTSo
         C0JVmg5QOm1/WbsI4hdygu8Tufgm5qZkaomy9d2u2JauGwmrpAMUxOHVYYGiOhRCg4n0
         JkZMVT+VJnz33uvEBUVA9aM5HGTyKXk2/KpesWQySaysfuuTfEh77FQiVhZl8GCpjLZi
         nfNGE9rbJKOWhW69wwez2xjrlF7mXp464VQdbtoAaJuvFJb6Bb1MF+NILpkM6G6Lvm6g
         Z4tQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447101; x=1792051901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=kc1CtXQl+riqf8kq8sxd/bY5fVHNFWmZpC3Syiyh+ih4VXLbpJgMhQ4gmkSizcROLt
         KYHrkUzsrOZZJkS9LRZqvoUY0WpZ6LZGsNqzRzC5lnpqAFe6ybNT/u8vtub6UEwS1TZk
         P4zonkttS6U4TvxJ9ivgNqPNtZ9pcVkZy86eCWfB2XU9+1zJsrAB7jax57FfBdj4FY/c
         dTcvxKvURYmobxZwBjO/maQlkiZU/zjGOohFdqZhYeZYgXJpxWkV2gxGbEgvPhHmBizh
         SH1ghQUIogtgG90CY5cgECu+w1eBDPk43Alh45a+ApKpKMKzPu1eOaI/f6IACTx42AWi
         p4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447101; x=1792051901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=nNomVEgND7QTYsHw9AbVGWJRwp6AUOgEYIcMOBgLEglVys7fRVE5wG+knmj+Vhd5c7
         k7AMwVGaCQN3RdvrkDPsOyVfqkjguO6ZMufk3nssRKaJ5ovg1iTW9lU0sbxkX58Bmp/1
         +L3qeab+IZff355P5EBHxMTpPTVY5SW20h/UXqoIn3fBO7vlLDmmy3+XdfUC8LMLwD0T
         XW3aLjVyr79BST4sb9Pl23kGmNh2AI+G8vsGH0zk08qCNcNkIYLoxZ5+T/dyjuMbn0Y6
         WcRaiUym652IAQQ66vHO6BFI2NSuzmAtiEXln9DTD72z+gWw4hhadd63H9oEJmBJkHgP
         BPiA==
X-Forwarded-Encrypted: i=1; AKwUvByNXZEdSakwboQV93c5EY0phe3zPOCYWqExahQ+xqNIyOxdEKN9+P2q/7i7gZK0yhKBRDODKYJqTNWCKw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK7u8b075f6xHcK9oOMRpTgIavScmN6eTZ2UWspvsvqsnrnvjPA
	9/Gv6Ic13FcBTr2Ay6Vl58i+tQVKOnUZD2U8wfaXaWo3FLn0dvHRYqwXtnfWiEx6Xixno/NI6v5
	ZASUuqRyUxI8pHYP/lZ4foPZTYtjqI2ibzeFk8ODYqoA/S8FHxyhA+6Cp3bDIqntA/GsxLahi40
	DWVWnxIsjgLPyVtTK5yuqFUAgMRHyxIHHDpTip7A7avifJfg==
X-Gm-Gg: AYBFou0gcXdwxIDWyT44U4hMjHGqALR4GkbgAu+pQY/aMglxrjhgmgJBQYJJpjqUY5X
	Pq5ncGlN4WVVSQ3wo0cwlzhFXSU9lnDNnMILglAAPd+wwb7jrNwJ8YV9RA3qQVV7HxmXydhBNXd
	eukOE+a1WbV4VhZuldj5W7T0uP7GfyaAoK8iq27/nC6D0o2/yt5tBkzW8=
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id 956f58d0204a3-6790a3ba2b6mr1617782d50.15.1791447101131;
        Thu, 08 Oct 2026 01:11:41 -0700 (PDT)
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id
 956f58d0204a3-6790a3ba2b6mr1617763d50.15.1791447100494; Thu, 08 Oct 2026
 01:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:11:29 +0200
X-Gm-Features: AclHuK_ulwLbOdiOwhVLyKYI0w-jUZto9bQrzFykzb9tv-znqnJpL93tMSNQoQQ
Message-ID: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX52mw0A1qBPAI
 3EXO8e9HlvKpdgztgnACv5Wsf1A0aswbG2MilwPbwCS1Ga9/j3F4rOQPfxFo6d4w4djHrFSR/8h
 uorB+WnCuBgLChqazYJ99hJDdZUBMsY=
X-Proofpoint-ORIG-GUID: 98Mm0oANqggpLGLesVE7fhknH7UKBXnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX33FddVuaHTHU
 6nL8RxOQf+AUgW5LANfR6RX4RVOs8dnsb3x3XxoJ9rDZkJOysVKSXD2q5juCCinFY0pTjawExcS
 MZyurzyK4DCKG51PhRgbOiS6UgkNkWYy3oEGAZ/OTBwuHNkl5BYQdi7ebrGpQh7IunKiDKzaKml
 hT0G82CSO60XCx4fFXUYF4lxqLcNK01+x8oD4kJC6IS9XTKxei1EDZab5WmnP04BMblsvIxFtOE
 ClADGs8reSDZxsSQbfhQ7qudHBxxgjRmW+H7/9U7i6YFZJ9sdLJ6XuRJ5EsqKAKlYdwsR+5YuAT
 DbbE8SZ5vEkwuelRvhSKsm/ko8lzjohzc6Yv7X/plTg0GVOSgvWZXcHUQ9Q91DRAsSWFjOqk0xl
 Nr4ABgSU3nJzQmbIR7T0NcT1ElhgCPuGyqw+1Qgh7YOcBpupO8is2T71WqFa2unQ4WFNN+4YRsP
 WM6dGN4o840UTX6k8xg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7503d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ErwVIQJsGMf6Wn3gpasA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: 98Mm0oANqggpLGLesVE7fhknH7UKBXnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_011143_453557_526D7E80 
X-CRM114-Status: GOOD (  26.80  )
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

T24gVHVlLCBPY3QgNiwgMjAyNiBhdCAyOjQw4oCvQU0gQW1pcnJlemEgWmFycmFiaQo8YW1pcnJl
emEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9QLVRFRSBjb21tYW5kcyBj
YW4gc3BhbiBtdWx0aXBsZSBleGNoYW5nZXMgd2l0aCBub3JtYWwgd29ybGQuIEEgY2FsbAo+IG1h
eSB5aWVsZCB0byByZXF1ZXN0IGFuIFJQQyBzZXJ2aWNlIG9yIGFsbG93IGludGVycnVwdCBwcm9j
ZXNzaW5nCj4gYmVmb3JlIGNvbnRpbnVpbmcgZXhlY3V0aW9uIGluIHNlY3VyZSB3b3JsZC4KPgo+
IEFkZCB0aGUgUlBNSSB5aWVsZGluZy1jYWxsIHBhdGggdXNlZCBieSB0aGUgY29tbW9uIE9QLVRF
RSBzZXNzaW9uCj4gb3BlcmF0aW9ucy4gU3VibWl0IHRoZSBjb21tYW5kIGFuZCBSUEMgYXJndW1l
bnQgYnVmZmVycyBhcyByYW5nZXMKPiB3aXRoaW4gYSBzaGFyZWQgbWVtb3J5IHBhcmNlbC4KPgo+
IEhhbmRsZSBSUEMgcmVxdWVzdHMgd2hpbGUgdGhlIGNhbGwgaXMgc3VzcGVuZGVkIGFuZCByZXN1
bWUgZXhlY3V0aW9uCj4gdXNpbmcgdGhlIHRva2VuIHJldHVybmVkIGJ5IE9QLVRFRSB1bnRpbCB0
aGUgY29tbWFuZCBjb21wbGV0ZXMuCj4KPiBVc2UgdGhlIGNvbW1vbiBPUC1URUUgY2FsbCBxdWV1
ZSB0byB3YWl0IHdoZW4gYW4gaW5pdGlhbCByZXF1ZXN0IGlzCj4gcmVqZWN0ZWQgd2l0aCBSUE1J
X0VSUl9CVVNZLCBhbGxvd2luZyBhbm90aGVyIGFjdGl2ZSBjYWxsIHRvIGNvbXBsZXRlCj4gYmVm
b3JlIHJldHJ5aW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW1pcnJlemEgWmFycmFiaSA8YW1pcnJl
emEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3RlZS9vcHRlZS9y
cG1pX2FiaS5jIHwgMTI0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90ZWUvb3B0ZWUvcnBtaV9hYmkuYyBiL2RyaXZlcnMvdGVlL29wdGVlL3JwbWlfYWJp
LmMKPiBpbmRleCA1OGQ4MjY3OGJlOTguLjZlNzYzMTY3OTRjMSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3RlZS9vcHRlZS9ycG1pX2FiaS5jCj4gKysrIGIvZHJpdmVycy90ZWUvb3B0ZWUvcnBtaV9h
YmkuYwo+IEBAIC05LDYgKzksNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvbWFpbGJveC9yaXNjdi1y
cG1pLW1lc3NhZ2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L292ZXJmbG93Lmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9ycG1pX3RlZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3VuYWxpZ25lZC5oPgo+ICAjaW5j
bHVkZSAib3B0ZWVfcHJpdmF0ZS5oIgo+IEBAIC01NjAsMyArNTYxLDEyNiBAQCBzdGF0aWMgdm9p
ZCBvcHRlZV9ycG1pX2hhbmRsZV9ycGNfY21kKHN0cnVjdCB0ZWVfY29udGV4dCAqY3R4LAo+ICAg
ICAgICAgICAgICAgICBvcHRlZV9ycGNfY21kKGN0eCwgb3B0ZWUsIGFyZyk7Cj4gICAgICAgICB9
Cj4gIH0KPiArCj4gKy8qIEhhbmRsZSBSUEMgY29tbWFuZCBvciBpbnRlcnJ1cHQgcmV0dXJucyBm
cm9tIGEgeWllbGRpbmcgY2FsbC4gKi8KPiArc3RhdGljIHZvaWQgb3B0ZWVfcnBtaV9oYW5kbGVf
cnBjKHN0cnVjdCB0ZWVfY29udGV4dCAqY3R4LCBzdHJ1Y3Qgb3B0ZWUgKm9wdGVlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgcmVzdWx0LCBzdHJ1Y3Qgb3B0ZWVfbXNn
X2FyZyAqYXJnKQo+ICt7Cj4gKyAgICAgICBzd2l0Y2ggKHJlc3VsdCkgewo+ICsgICAgICAgY2Fz
ZSBPUFRFRV9SUE1JX1lJRUxESU5HX0NBTExfUkVUVVJOX1JQQ19DTUQ6Cj4gKyAgICAgICAgICAg
ICAgIG9wdGVlX3JwbWlfaGFuZGxlX3JwY19jbWQoY3R4LCBvcHRlZSwgYXJnKTsKPiArICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIE9QVEVFX1JQTUlfWUlFTERJTkdfQ0FMTF9S
RVRVUk5fSU5URVJSVVBUOgo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGRlZmF1
bHQ6Cj4gKyAgICAgICAgICAgICAgIHByX3dhcm4oIlVua25vd24gUlBDIGZ1bmMgMHgleFxuIiwg
cmVzdWx0KTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICB9Cj4gK30KPiArCj4g
Ky8qKgo+ICsgKiBvcHRlZV9ycG1pX3lpZWxkaW5nX2NhbGwoKSAtIHN1Ym1pdCBhbmQgcmVzdW1l
IGEgeWllbGRpbmcgUlBNSSBjb21tYW5kCj4gKyAqIEBjdHg6IGNhbGxpbmcgY29udGV4dAo+ICsg
KiBAcmVxOiBpbml0aWFsIGNvbW1hbmQgcmVxdWVzdAo+ICsgKiBAcnBjX2FyZzogc2hhcmVkIFJQ
QyBhcmd1bWVudCBidWZmZXIKPiArICogQHN5c3RlbV90aHJlYWQ6IGNhbGxlciByZXF1ZXN0cyBU
RUUgc3lzdGVtIHRocmVhZCBzdXBwb3J0Cj4gKyAqCj4gKyAqIE9ubHkgUlBNSV9FUlJfQlVTWSBy
ZWplY3Rpb24gb2YgdGhlIGluaXRpYWwgY29tbWFuZCBwZXJtaXRzIHJldHJ5Lgo+ICsgKgo+ICsg
KiBSZXR1cm46IHplcm8gb24gY29tcGxldGlvbiwgb3IgYSBuZWdhdGl2ZSBlcnJvci4KPiArICov
Cj4gK3N0YXRpYyBpbnQgb3B0ZWVfcnBtaV95aWVsZGluZ19jYWxsKHN0cnVjdCB0ZWVfY29udGV4
dCAqY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBvcHRlZV9ycG1pX2NhbGxfcmVxICpyZXEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IG9wdGVlX21zZ19hcmcgKnJwY19hcmcsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBzeXN0ZW1fdGhyZWFkKQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3Qgb3B0ZWUgKm9wdGVlID0gdGVlX2dldF9kcnZkYXRhKGN0eC0+dGVlZGV2KTsKPiArICAg
ICAgIHN0cnVjdCBvcHRlZV9ycG1pX3Jlc3VtZV9yZXEgcmVzdW1lID0gewo+ICsgICAgICAgICAg
ICAgICAub3AgPSBjcHVfdG9fbGUzMihPUFRFRV9SUE1JX1lJRUxESU5HX0NBTExfUkVTVU1FKSwK
PiArICAgICAgICAgICAgICAgLyogcmVzdW1lX3Rva2VuIGlzIG5vbnplcm8gYWZ0ZXIgT1AtVEVF
IHN1c3BlbmRzIHRoZSBjYWxsLiAqLwo+ICsgICAgICAgICAgICAgICAucmVzdW1lX3Rva2VuID0g
MCwKCkkgbWlzc2VkIHRoaXMgd2hlbiByZXZpZXdpbmcgInRlZTogb3B0ZWU6IGRlZmluZSB0aGUg
UlBNSSBjb250cm9sIGFuZApwYXJjZWwtcmVmZXJlbmNlIEFCSSIuIEknZCBwcmVmZXIgaWYgdGhl
IHJlc3VtZV90b2tlbiB3YXMgYSB0cnVseQpvcGFxdWUgdmFsdWUsIGp1c3QgYXMgZm9yIHRoZSBT
TUMgYW5kIEZGLUEgQUJJcy4gQW55IHJlYXNvbiB3aHkgaXQncyBhCjY0LWJpdCB2YWx1ZSBpbnN0
ZWFkIG9mIDMyLWJpdCwgYXMgaXMgdXNlZCBmb3IgdGhlIG90aGVyIEFCST8KCj4gKyAgICAgICB9
Owo+ICsgICAgICAgc3RydWN0IG9wdGVlX3JwbWlfY2FsbF9yZXNwIHJlc3A7Cj4gKyAgICAgICBz
dHJ1Y3Qgb3B0ZWVfY2FsbF93YWl0ZXIgd2FpdGVyOwo+ICsgICAgICAgdTMyIHJlc3VsdDsKPiAr
ICAgICAgIHMzMiBzdGF0dXM7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIG9wdGVl
X2NxX3dhaXRfaW5pdCgmb3B0ZWUtPmNhbGxfcXVldWUsICZ3YWl0ZXIsIHN5c3RlbV90aHJlYWQp
Owo+ICsgICAgICAgd2hpbGUgKHRydWUpIHsKPiArICAgICAgICAgICAgICAgaWYgKHJlc3VtZS5y
ZXN1bWVfdG9rZW4pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb3B0ZWVfcnBtaV9j
YWxsX3dpdGhfc3RhdHVzKG9wdGVlLCAmcmVzdW1lLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YocmVzdW1lKSwgJnJlc3As
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihyZXNwKSwgJnN0YXR1cyk7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSBvcHRlZV9ycG1pX2NhbGxfd2l0aF9zdGF0dXMob3B0
ZWUsIHJlcSwgc2l6ZW9mKCpyZXEpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmcmVzcCwgc2l6ZW9mKHJlc3ApLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3RhdHVz
KTsKClBsZWFzZSBmaXggdGhlIHRvby1sb25nIGxpbmVzIGFib3ZlLgoKPiArICAgICAgICAgICAg
ICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gKwo+ICsg
ICAgICAgICAgICAgICBzd2l0Y2ggKHN0YXR1cykgewo+ICsgICAgICAgICAgICAgICBjYXNlIFJQ
TUlfU1VDQ0VTUzoKCkFueSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgd2UgYXJlbid0IHVzaW5nIFRF
RSBlcnJvciBjb2RlcyBoZXJlPwoKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAr
ICAgICAgICAgICAgICAgY2FzZSBSUE1JX0VSUl9CVVNZOgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghcmVzdW1lLnJlc3VtZV90b2tlbikgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgb3B0ZWVfY3Ffd2FpdF9mb3JfY29tcGxldGlvbigmb3B0ZWUtPmNhbGxfcXVldWUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZ3YWl0ZXIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBmYWxsdGhyb3VnaDsKPiArICAgICAgICAgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBycG1pX3RvX2xpbnV4X2Vycm9yKHN0YXR1cyk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBkb25lOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsg
ICAgICAgICAgICAgICByZXN1bHQgPSBnZXRfdW5hbGlnbmVkX2xlMzIoJnJlc3AucmVzdWx0KTsK
CldoeSBub3QgbGUzMl90b19jcHUocmVzcC5yZXN1bHQpPwoKQ2hlZXJzLApKZW5zCgo+ICsgICAg
ICAgICAgICAgICBpZiAocmVzdWx0ID09IE9QVEVFX1JQTUlfWUlFTERJTkdfQ0FMTF9SRVRVUk5f
RE9ORSkKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBjb25kX3Jlc2NoZWQoKTsKPiArICAgICAgICAgICAgICAgb3B0ZWVfcnBtaV9oYW5k
bGVfcnBjKGN0eCwgb3B0ZWUsIHJlc3VsdCwgcnBjX2FyZyk7Cj4gKwo+ICsgICAgICAgICAgICAg
ICByZXN1bWUucmVzdW1lX3Rva2VuID0gcmVzcC5yZXN1bWVfdG9rZW47Cj4gKyAgICAgICB9Cj4g
K2RvbmU6Cj4gKyAgICAgICBvcHRlZV9jcV93YWl0X2ZpbmFsKCZvcHRlZS0+Y2FsbF9xdWV1ZSwg
JndhaXRlcik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArfQo+ICsKPiArLyogVGhlIGNh
bGxlciBzdXBwbGllcyBTSE0gd2l0aCByb29tIGZvciBjb21tYW5kIGFuZCBSUEMgYXJncy4gKi8K
PiArc3RhdGljIGludCBvcHRlZV9ycG1pX2RvX2NhbGxfd2l0aF9hcmcoc3RydWN0IHRlZV9jb250
ZXh0ICpjdHgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHRlZV9zaG0gKnNobSwgdV9pbnQgb2ZmcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIHN5c3RlbV90aHJlYWQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBvcHRl
ZSAqb3B0ZWUgPSB0ZWVfZ2V0X2RydmRhdGEoY3R4LT50ZWVkZXYpOwo+ICsgICAgICAgc3RydWN0
IG9wdGVlX21zZ19hcmcgKmFyZywgKnJwY19hcmc7Cj4gKyAgICAgICBzdHJ1Y3Qgb3B0ZWVfcnBt
aV9jYWxsX3JlcSByZXE7Cj4gKyAgICAgICBzaXplX3QgYXJnX3NpemUsIHJwY19zaXplLCBycGNf
b2Zmc2V0Owo+ICsgICAgICAgdTMyIHBhcmNlbF9pZCwgbm9uY2U7Cj4gKwo+ICsgICAgICAgYXJn
ID0gdGVlX3NobV9nZXRfdmEoc2htLCBvZmZzKTsKPiArICAgICAgIGlmIChJU19FUlIoYXJnKSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoYXJnKTsKPiArCj4gKyAgICAgICBhcmdf
c2l6ZSA9IE9QVEVFX01TR19HRVRfQVJHX1NJWkUoYXJnLT5udW1fcGFyYW1zKTsKPiArICAgICAg
IHJwY19zaXplID0gT1BURUVfTVNHX0dFVF9BUkdfU0laRShvcHRlZS0+cnBjX3BhcmFtX2NvdW50
KTsKPiArICAgICAgIHJwY19vZmZzZXQgPSBvZmZzICsgYXJnX3NpemU7Cj4gKyAgICAgICBycGNf
YXJnID0gdGVlX3NobV9nZXRfdmEoc2htLCBycGNfb2Zmc2V0KTsKPiArICAgICAgIGlmIChJU19F
UlIocnBjX2FyZykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJwY19hcmcpOwo+
ICsKPiArICAgICAgIG9wdGVlX3JwbWlfc2htX2dldF9pZGVudGl0eShzaG0sICZwYXJjZWxfaWQs
ICZub25jZSk7Cj4gKwo+ICsgICAgICAgcmVxLm9wID0gY3B1X3RvX2xlMzIoT1BURUVfUlBNSV9Z
SUVMRElOR19DQUxMX1dJVEhfQVJHKTsKPiArICAgICAgIHJlcS5wYXJjZWxfaWQgPSBjcHVfdG9f
bGUzMihwYXJjZWxfaWQpOwo+ICsgICAgICAgcmVxLm5vbmNlID0gY3B1X3RvX2xlMzIobm9uY2Up
Owo+ICsgICAgICAgcmVxLmFyZ19vZmZzZXQgPSBjcHVfdG9fbGU2NCgodTY0KXNobS0+b2Zmc2V0
ICsgb2Zmcyk7Cj4gKyAgICAgICByZXEucnBjX29mZnNldCA9IGNwdV90b19sZTY0KCh1NjQpc2ht
LT5vZmZzZXQgKyBycGNfb2Zmc2V0KTsKPiArICAgICAgIHJlcS5hcmdfc2l6ZSA9IGNwdV90b19s
ZTMyKGFyZ19zaXplKTsKPiArICAgICAgIHJlcS5ycGNfc2l6ZSA9IGNwdV90b19sZTMyKHJwY19z
aXplKTsKPiArCj4gKyAgICAgICByZXR1cm4gb3B0ZWVfcnBtaV95aWVsZGluZ19jYWxsKGN0eCwg
JnJlcSwgcnBjX2FyZywgc3lzdGVtX3RocmVhZCk7Cj4gK30KPgo+IC0tCj4gMi4zNC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
