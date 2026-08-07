Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B980EC5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo3LNrtWDSrQ7WY9VzZKFX8NDK3pInD7GdjoJXvILpw=; b=AFxiot9rG66aTV
	6JCtPPACqVwMtowZcKSuy3RmcRz07XUfKNu6n+rlXdSW7TFIY8dBSycrDpcJU0h8C4DnJ/RKW06Wc
	MLOM1DQ6kugWySopGmGDt+mLRI9veOVgy6T4qYf0IA1l7Njlb9QAasv0tVKhYSwycm/nOOYKxutDC
	Ni1MlEEMayrPkhoGtrDITGtCFIFOWd5e987FwC8eMLwBa2c687whZpd5s9c/t4eulxcaDdbzgJNO4
	I6HBC+YhnXNcSF0xzn95q7cMnkdK7EjEnEKuynt60tmTvttal1y9EXXWkXHJ06Kzioyyom0pgm5aj
	hlHVpRxH92+7680rhc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFVJ-00000007Jr9-0Psf;
	Fri, 07 Aug 2026 08:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFVH-00000007Jqe-2yio
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rz1Ovtp0lRRSorwHRFkQmOUrVeLLRc6Z2jrE2vIey9o=; b=ezkeJglsMNcNtsgltsvAHMvNZ3
	58bblLk1KaJRxVVk5uP+QOtMz2E2WHJ5zeoHRljlQfehrUPvvtk9I5y+RlhuWQs4XjMxL+9E315Vj
	R9W2ZSxqaFnUBzWcjfF8t/mB6K5TjH1wGTeRJnov50q9BcxMhaCUYvBBjtDgCbCrtgyuWkZ1Lx/Y4
	ftDrC9ugblB15QtNbaHVyFL5QJpt/okWUtvVMdjDE+59vdrW3k0DHHjpHq9w5qRIbITaqhWv6BkOH
	6/nvU3S1zhJ2yddfG3++cl1xzEY4lMKcl4CUkW17tbD17n00U0nvCIpmBbN1jI5ZkOgsIgDGobZWr
	niaI6JMw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFVE-0000000CAFW-0EMN
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:00:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GdpG4063176
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rz1Ovtp0lRRSorwHRFkQmOUrVeLLRc6Z2jrE2vIey9o=; b=Rk3kSraJ8dKX0nzb
	UibEXjODtRomlZVhf8SKNCmtToAEBVtjcllOCgSM9sGByKawGzciz1zmZswHEMpm
	3a+h/pkXE6iT0BBs7yGixKlazJv6ownAJJXBSFvrf2Vr187Xnesi0u/qt3FaCcTq
	f+VF0wTpQXvVJpylh0piALjA6SGkzG2GxvnF7OV731xJzMvgEvC5oGUtfrftmyYW
	SFnSaBYVxgPEhc/WW1YjQmcu8z6b448UsKcZXFwDy4NGoXvfBUAu9nON1YmXJ3p0
	pI4yfzm9v/FynBfd51JJbyOZp5S2IzF/MBb0M+7rN8nHcI7XGgz9g/q/jeln6BFp
	eLN+EA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hatnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 08:00:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f18aff8226so2922003a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 01:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786089621; cv=none;
        d=google.com; s=arc-20260327;
        b=ZmASj9uaOaGHm6zySSCqL3p2W5H9x4/Dx/asPqbdopl+THYHvCym6ufwsIyF8i0EMo
         vwC7SxXNRDtGXO8BqVRO81sHGKIwXuu6bJQqeUeyrNzoKgOiNrZzBRLrJQEjdchH+4PJ
         zzHijCHObCWM8tfe+nc8BDJhqzuSY1yDiuDHIz2p6cSHA3du+RWyQKHbu/KogcpI+Syf
         TAx1p+RjA2mp0bmubo6sKT5pBclWJ3Xeb62IzSrseej0WSqvOWeDSU4blytMeihoA+gP
         s7RNjCx5RXCd9SZp4WkbInenGdksMbH27riQ/AgkIryjnDonKSvFA9t6IcZWRMXaQlXE
         oVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rz1Ovtp0lRRSorwHRFkQmOUrVeLLRc6Z2jrE2vIey9o=;
        fh=y3GcupmA5pZG5Mjsx5BySOdR5CT85xueO6Nv+st7rvA=;
        b=gOyJ6VnT2w/ao6CUbPUzcri0byulWYWecyXg6xoLKvkS4Lx9sh8U+8wpQ6HqH+eXLj
         lgklSpchMmZuIjyE2pjTTGy0shx9/qKEatVzFiE+i2X+aArSoaKPUPJFB86qGlAPrT7/
         eqJuB61t4Uf+BjkKkmMXZqO1eL1Cr3HwMxp7hUPzHNH8ptXw7pDfi23hIX83Ls4U+d9A
         PtUK4yHE4R0+ZIQ4W3c3h/Nttw5YVwrTqZtFMN59czInaHxmgItW0qEu+tl01pM671Tw
         81Soq+pwsQme8jM36ZzfWoXf1uhh7LJXolLYlqFe9vkLJIyNwi2puaOokuNM9dNhKqxf
         YlLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089621; x=1786694421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rz1Ovtp0lRRSorwHRFkQmOUrVeLLRc6Z2jrE2vIey9o=;
        b=F12Eils00FIpPFR7IC/p9mjwBEpw/9xobhqfGFVvGCumYEi3T4CwkNdlyh/w+OkGWa
         9IAGytWtd8+TtIEX9Zi6b1q2KJlZzesHOZLt5M+ipXQIB7zp2aT0h1rIglPsOKMoBsZa
         7Jbo1Zj5iARe1XOCE0StTWqh6XGLrpLW7qOvKh2LljL4QJQlz4R6Ic9Rfiyxm8nWCYQ6
         dndNGcE+P/Ls5M0yXU29cz12cMQw6b1J7sS3D13c+wp8iPg5vxRfZua/2nVPoG20jNAd
         PcZoGRyV2CEEjhvuqwuZlS5SLNvVLSE/U7UUOcGouz4vwXcJ7Erurl5knDQS6fRUZuqs
         fetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089621; x=1786694421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rz1Ovtp0lRRSorwHRFkQmOUrVeLLRc6Z2jrE2vIey9o=;
        b=U1JSo+b8IIh0CW8chvQQqLyJoK6ULAbYTIndtV62Qr7iQY8gls6Pl/WUVzF03H6fCA
         f1M6QDLuLmhybwCJ/MHFqF/CSx6LEqNQeRI5CX6QH683NMylFvv5iWJ3ZAGgUxBQ3AE7
         d39dA++TS9yS+vbIMcnwAG7bsv0CSo9B37vcOTLMcOtuBKAnWmFHlDeDU2H8BAbz2AOR
         u+k82xRF2fCHhMEMh91NNB6n40skmYirqqJl6XGapTJW1h3icYe9+4bo+RG3K32YhASQ
         Q6AfoW9PXg6UrdPsG83VhrjiqnuQ58gLRFSlo6iVRGC7Ek4J9XO2FTBGqP/ewXG8B1cR
         vwdQ==
X-Gm-Message-State: AOJu0YxWdEjbtnRBw7wG+PObqkZLz5LeKq2k6ojPXhxDazYXCsFhtKtf
	zw614PX8IAGsHdtOElZTLz3hY0QXzDBiDxtLlnnL+aovun3iWzmuhMRNHccmeJ45hYrI9GWVh2h
	KxozC6eunjd5kUdGPF7DHHjRo2yB7KsLBiFguCHrbZ/2YVkmTJhgZhKT1pV+iwKYpEHjIrB0m8X
	lZ1ILrpzXnnS19zBqIFxd5dDiQU2Ha2So+jiJCGHxONi4FDA==
X-Gm-Gg: AR+sD13XJ1pPU3Ksq06iu0ZuaO53+ecFJg+jcDxoJ6gTTXcg6uY2h0IFkhZTHjI/Psd
	x0E7qqJNLWYhYsg0GrjZKpRvNdtMGaa+dJ9Ymjdxh3k15jxBGBJvT1f4OZrlxlfFS4SOSbEqp1l
	LtBbYr9tG5zv7qJzdBjbzJzLs7u+MqWLrgoWPyT8d1Bf7pEdpZj8MaUdxw8Gw=
X-Received: by 2002:a4a:ee0a:0:b0:6ae:6f38:dac with SMTP id 006d021491bc7-6ae96c8490emr11151469eaf.10.1786089620868;
        Fri, 07 Aug 2026 01:00:20 -0700 (PDT)
X-Received: by 2002:a4a:ee0a:0:b0:6ae:6f38:dac with SMTP id
 006d021491bc7-6ae96c8490emr11151435eaf.10.1786089620328; Fri, 07 Aug 2026
 01:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com> <CADRr4be9p14tQcx=v-jVwfXwka0eBV8MWPfj1G4qcqv=yfxjfg@mail.gmail.com>
In-Reply-To: <CADRr4be9p14tQcx=v-jVwfXwka0eBV8MWPfj1G4qcqv=yfxjfg@mail.gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 13:30:09 +0530
X-Gm-Features: AUfX_myyzPsGPMEiPBjv-qXkZtGDwWzgL_zTnFCpzHjBdVAaiKFe8VqbQa-GIs8
Message-ID: <CA+Ht8=Y3CJA0jq3o0j--jA-avcBm576zm-54+BxoRfm6JB72Hw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce support for hardware break/watchpoints
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, qingfang.deng@linux.dev, alex@ghiti.fr,
        aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
        shuah@kernel.org, linux-kernel@vger.kernel.org,
        thecharlesjenkins@gmail.com
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a759095 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=JfrnYn6hAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=argSYUE4h49Yzq0yaQAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=1CNFftbPRP8L7MoqJWF3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: G5Z23wOj201ZuMAoQG00n8rltDzvfdFw
X-Proofpoint-ORIG-GUID: G5Z23wOj201ZuMAoQG00n8rltDzvfdFw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1OCBTYWx0ZWRfX3k/QEGUs5pJd
 gNN8UNRU3/Qq6/iAfAPhx+k7fuuQbVc77OUUgGJTwibV4xVVOH8zMjikzFHU8UFYcxVIFWcVJzc
 A7H/CND8ioxni3S8XfDY0U3CPuCs8UE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1OCBTYWx0ZWRfX3Yo44CeaCb6R
 5ezhURzR/04+92e3jpkArY5lZUq7HwwHxRNRiaStAWU0/dodjCrMDoAZUpc9/9BDy1vMUC42EEs
 ZiHd6Uf6TzHwCh5Ij/Paq+mst3U4M1H1BZUcMY2yN3NyPHTNoG2LnCOZt7susBoMQ5Y4l3qWdpL
 ByqUeEEnK/MN/5xy3eBp3y94y+JjyJsa9Wf7dubX3ChYqWOHc8weUxMys3YuzYNPu7cvoBvoMo4
 LUP5R297WyTETPfeoIGkuYZi/C8943pJsOUo3eplme36uYcT4EsTIhwe7I3vP/rdTX2sYl5wdHo
 SKeUjtT3LLHUeNEN7Z5ez2kDITNqtU/IG5wtYe3ac2i/bpq/kTlOFMwCXB3E9zfi7Hw6aEQCzfj
 +RvWR7xmpmECQkiYqKtmM4SOtbeVKs0R2zmLT1E+LT9wQVmiElcf9acwhi8oQ6fGOKE8bUY9iEK
 Nf1Vn7N0PlyQKYokbpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090028_523896_93A5B742 
X-CRM114-Status: GOOD (  40.52  )
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

T24gVHVlLCBBdWcgNCwgMjAyNiBhdCAxMDo0MuKAr1BNIEplc3NlIFRhdWJlIDxqdGF1YmVwZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDMsIDIwMjYgYXQgOTo0OeKAr0FNIEhp
bWFuc2h1IENoYXVoYW4KPiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPiB3cm90
ZToKPiA+Cj4gPiBUaGlzIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgaGFyZHdhcmUgYnJlYWtw
b2ludHMgYW5kIHdhdGNocG9pbnRzIGluIHRoZQo+ID4gUklTQy1WIGFyY2hpdGVjdHVyZS4gVGhl
IGZyYW1ld29yayBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIHBlcmYgc3Vic3lzdGVtIGFuZAo+ID4g
dGhlIFNCSSBkZWJ1ZyB0cmlnZ2VyIGV4dGVuc2lvbiAoU2R0cmlnKS4KPiA+Cj4gPiB2NiBleHRl
bmRzIHY1IHdpdGggdHdvIG5ldyBwYXRjaGVzOgo+ID4KPiA+ICAgLSBwdHJhY2Ugc3VwcG9ydDog
ZGVidWdnZXJzIGNhbiBub3cgc2V0IGFuZCBxdWVyeSBoYXJkd2FyZSBkZWJ1ZyB0cmlnZ2Vycwo+
ID4gICAgIHRocm91Z2ggdGhlIHN0YW5kYXJkIFBUUkFDRV9HRVRSRUdTRVQvU0VUUkVHU0VUIGlu
dGVyZmFjZSB1c2luZyBuZXcKPiA+ICAgICBOVF9SSVNDVl9IV19CUkVBSy9XQVRDSCBub3RlIHR5
cGVzLiBBIHNpbXBsZXIgUFRSQUNFX0dFVEhCUFJFR1MvU0VUSEJQUkVHUwo+ID4gICAgIHJlcXVl
c3QgcGFpciBpcyBhbHNvIHByb3ZpZGVkIGZvciBkaXJlY3Qgc2luZ2xlLXRyaWdnZXIgYWNjZXNz
IHdpdGhvdXQgZ29pbmcKPiA+ICAgICB0aHJvdWdoIHRoZSByZWdzZXQgbWFjaGluZXJ5LiBUaHJl
YWQgZmx1c2gvY29weSBob29rcyBhcmUgd2lyZWQgdXAgc28KPiA+ICAgICBwZXItdGFzayBicmVh
a3BvaW50cyBhcmUgY2xlYW5lZCB1cCBhY3Jvc3MgZm9yay9leGVjLgo+ID4KPiA+ICAgLSBFeHRl
bmRlZCBzZWxmdGVzdDogdGhlIGV4aXN0aW5nIHBlcmZfZXZlbnQtYmFzZWQgc2VsZnRlc3QgaXMg
ZXh0ZW5kZWQgdG8KPiA+ICAgICBhbHNvIGV4ZXJjaXNlIHRoZSBuZXcgcHRyYWNlIEdFVFJFR1NF
VC9TRVRSRUdTRVQgcmVnc2V0IHBhdGggYW5kIHRoZSByYXcKPiA+ICAgICBQVFJBQ0VfR0VUSEJQ
UkVHUy9TRVRIQlBSRUdTIGludGVyZmFjZS4KPgo+IEkgd291bGQgcmVjb21lbnQgYWRkYXBpbmcK
PiBgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnJlYWtwb2ludHMvYnJlYWtwb2ludF90ZXN0X2Fy
bTY0LmNgIGFzIGEKPiB0ZXN0Lgo+IEkgc2V0IHVwIGEgdGVzdCByZXBvc2l0b3J5IGhlcmUKPiBo
dHRwczovL2dpdGh1Yi5jb20vTXItQm9zc21hbi9kYnRyLWJ1aWxkcm9vdCBmb3IgYW55b25lIGVs
c2UgdG8gdGVzdAo+IHRoaXMgc2V0Lgo+Cj4gVW5mb3J0dW5hdGx5IHRoaXMgc2V0IGZhaWxzIGBw
ZXJmIHRlc3QgMTUgMTYgMTcgMThgLiBJIHdvdWxkIGxpa2UKPiB0aG9zZSB0ZXN0cyB0byBwYXNz
Cj4gYmVmb3JlIGFjY2VwdGluZyB0aGlzIHNldC4gTXkgc2V0IGFkZHJlc3NlcyB0aGUgcGVyZiBm
YWlsdXJlcyB3aGljaCBpcyB3aHkgaXQgaXMKPiBtb3JlIGNvbXBsaWNhdGVkLgo+Cj4gSSB3b3Vs
ZCBoaWdobHkgcmVjb21tZW5kIGJhc2luZyB5b3VyIHNldCBvZmYgb2YgaXQgYXMgaXQgZml4ZXMg
bWFueSBvZgo+IHRoZSBpc3N1ZXMgdGhhdAo+IEkgY29tbWVudGVkIG9uIGluIFY1LiBUaGUgZmly
c3QgdHdvIGNvbW1pdHMgaW4gbXkgc2VyaWVzIGFyZQo+IHJlZmFjdG9yaW5nIGR1cGxpY2F0ZSBj
b2RlLAo+IGFuZCBjYW4gdGVjaG5pY2FsbHkgYmUgZHJvcHBlZC4gRXZlbiBpZiB5b3UgZG9uJ3Qg
Z28gZm9yd2FyZCB3aXRoIHVzaW5nIG15IHNldCwKPiBJIHdvdWxkIGF0IGxlYXN0IHJlY29tbWVu
ZCB0YWtpbmcgYSBsb29rIGF0IGl0LCBlc3BlY2lhbGx5Cj4gYHJpc2N2OiBwdHJhY2U6IEFkZCBo
dyBicmVha3BvaW50IHJlZ3NldGAKPiBhbmQKPiBgcmlzY3Y6IHB0cmFjZTogQWRkIGh3IGJyZWFr
cG9pbnQgc3VwcG9ydGAKPiBhcyB0aGV5IGFyZSBzaWduaWZpY2FudGx5IHNpbXBsZXIuCj4KCkFs
bCB0aGF0IGlzIHRha2VuIGNhcmUgb2YuIFRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIGljb3VudCB0
cmlnZ2VycyBpbgpRZW11LiBPbmNlIEkgZml4IHRoYXQsIEkgd2lsbCBzZW5kIHY3IGFuZCBJdCB3
aWxsIGNvbnRhaW4gc2luZ2xlCnN0ZXBwaW5nLgoKUmVnYXJkcwpIaW1hbnNodQoKPiBodHRwczov
L2dpdGh1Yi5jb20vTXItQm9zc21hbi9saW51eC9jb21taXRzL2Rldi9qZXNzZS9zZHRyaWctcmVi
YXNlLwo+Cj4gVGhhbmtzLAo+IEplc3NlIFRhdWJlCj4KPiA+IFNpbmdsZSBzdGVwcGluZyBpcyBy
ZWFkeSBhbmQgdGVzdCBidXQgdG8gZm9sbG93IHRoaXMgcGF0Y2ggc2V0Lgo+ID4gVmlydHVhbGl6
YXRpb24gb2YgZGVidWcgdHJpZ2dlcnMgYXJlIHBlbmRpbmcKPiA+Cj4gPiBUaGUgU0JJIGRlYnVn
IHRyaWdnZXIgZXh0ZW5zaW9uIGlzIHNwZWNpZmllZCBpbiBDaGFwdGVyIDE5IG9mIHRoZSBTQkkK
PiA+IHNwZWNpZmljYXRpb246Cj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNh
L3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvZG93bmxvYWQvdjMuMC9yaXNjdi1zYmkucGRmCj4gPgo+
ID4gVGhlIFNkdHJpZyBJU0EgaXMgcGFydCBvZiB0aGUgUklTQy1WIGRlYnVnIHNwZWNpZmljYXRp
b246Cj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1kZWJ1Zy1zcGVjCj4gPgo+
ID4gQ2hhbmdlcyBmcm9tIHY1Ogo+ID4gICAtIFJlYmFzZWQgdG8gdjcuMi1yYzYKPiA+ICAgLSBT
aW1wbGlmaWVkIE1hY3JvcyBpbiBod19icmVha3BvaW50LmgKPiA+ICAgLSBUb29rIGNhcmUgb2Yg
dGhlIHJldmlldyBjb21tZW50cwo+ID4gICAtIEFkZGVkIHB0cmFjZSBzdXBwb3J0IGZvciBoYXJk
d2FyZSBicmVhay93YXRjaHBvaW50cyAobmV3IHBhdGNoKQo+ID4gICAgIC0gUFRSQUNFX0dFVFJF
R1NFVC9TRVRSRUdTRVQgdmlhIE5UX1JJU0NWX0hXX0JSRUFLIC8gTlRfUklTQ1ZfSFdfV0FUQ0gK
PiA+ICAgICAtIFBUUkFDRV9HRVRIQlBSRUdTIC8gU0VUSEJQUkVHUyBmb3IgZGlyZWN0IHNpbmds
ZS10cmlnZ2VyIGFjY2Vzcwo+ID4gICAgIC0gSEFWRV9NSVhFRF9CUkVBS1BPSU5UU19SRUdTIHNl
bGVjdGVkIChicmVhay93YXRjaCBzaGFyZSB0cmlnZ2VyIHBvb2wpCj4gPiAgICAgLSBmbHVzaF9w
dHJhY2VfaHdfYnJlYWtwb2ludCAvIHB0cmFjZV9od19jb3B5X3RocmVhZCB3aXJlZCB1cAo+ID4g
ICAtIEV4dGVuZGVkIHNlbGZ0ZXN0IHRvIGNvdmVyIHB0cmFjZS1iYXNlZCBodyBicmVhay93YXRj
aHBvaW50IHBhdGhzIChuZXcgcGF0Y2gpCj4gPgo+ID4gQ2hhbmdlcyBmcm9tIHY0Ogo+ID4gICAt
IFJlYmFzZWQgdG8gdjcuMi1yYzQKPiA+ICAgLSBGaXhlZCBydjMyIGJ1aWxkIGVycm9yCj4gPiAg
IC0gQWRkZWQgcHJfZm10IHRvIHByaW50IEtCVUlMRF9NT0ROQU1FCj4gPiAgIC0gQ2hhbmdlZCB0
eXBlIG9mIHNobWVtX3BhIHRvIHBoeXNfYWRkcl90Cj4gPiAgIC0gVXNlIHBlcl9jcHVfcHRyX3Rv
X3BoeXMgaW5zdGVhZCBvZiBfX3BhIGZvciBwZXItY3B1IGFsbG9jYXRlZCBtZW1vcnkKPiA+ICAg
LSBQcmludCBzdWNjZXNzZnVsIHJlZ2lzdHJhdGlvbi91bnJlZ2lzdHJhdGlvbiBtZXNzYWdlIHdo
ZW4gbm8gZXJyb3IKPiA+ICAgLSBBZGRlZCBSSVNDLVYgREVCVUdHSU5HIHNlY3Rpb24gaW4gTUFJ
TlRBSU5FUlMgYW5kIGFkZGVkIG15c2VsZiBhcyBtYWludGFpbmVyCj4gPiAgIC0gRml4ZWQgd2Fy
bmluZ3MgZnJvbSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0IHJ1bgo+ID4KPiA+IENoYW5nZXMgZnJv
bSB2MzoKPiA+ICAgLSBSZWJhc2VkIHRvIHY3LjEtcmMzCj4gPiAgIC0gRm9yIHdhdGNocG9pbnRz
LCBjaGVjayB0ZGF0YTEuaGl0IHZpYSBTQklfRVhUX0RCVFJfVFJJR19SRUFEIGFuZCBrZWVwCj4g
PiAgICAgU1RWQUwtYmFzZWQgbWF0Y2hpbmcgYXMgZmFsbGJhY2sKPiA+ICAgLSBJbXByb3ZlZCB3
YXRjaHBvaW50IG1hdGNoaW5nIHdoZW4gU1RWQUwgcmVwb3J0cyB0aGUgbG93ZXN0IGFjY2Vzc2Vk
IGFkZHJlc3MKPiA+ICAgICBmb3Igd2lkZXIgbWVtb3J5IGFjY2Vzc2VzCj4gPiAgIC0gUHJvZ3Jh
bSBleGVjdXRlIGJyZWFrcG9pbnRzIHdpdGggU0laRT0wIChtYXRjaCBhbnkgc2l6ZSkgdG8gYXZv
aWQgbWlzc2VzCj4gPiAgICAgd2l0aCAxNi1iaXQvY29tcHJlc3NlZCBpbnN0cnVjdGlvbiBhZGRy
ZXNzZXMKPiA+ICAgLSBVcGRhdGVkIHNlbGZ0ZXN0IHRvIGF2b2lkIGRlYWRsb2NrIGJ5IHJlcGxh
Y2luZyB1bmJvdW5kZWQgc2VtX3dhaXQoKSB3aXRoCj4gPiAgICAgc2VtX3RpbWVkd2FpdCgpIHRp
bWVvdXQgaGFuZGxpbmcKPiA+ICAgLSBVcGRhdGVkIHNlbGZ0ZXN0IGJyZWFrcG9pbnQgZnVuY3Rp
b24gc28gaXQgY2Fubm90IGJlIGlubGluZWQgb3Igb3B0aW1pemVkIGF3YXkKPiA+Cj4gPiBDaGFu
Z2VzIGZyb20gdjI6Cj4gPiAgIC0gUmViYXNlZCB0byB2Ny4wLXJjMQo+ID4gICAtIEZpeGVkIHdh
cm5pbmdzIGZyb20gY2hlY2twYXRjaC5wbCAtLXN0cmljdCBydW4KPiA+Cj4gPiBDaGFuZ2VzIGZy
b20gdjE6Cj4gPiAgIC0gVGhlIHBhdGNoIGFkZGluZyB0aGUgU0JJIGV4dGVuc2lvbiBhbmQgZnVu
Y3Rpb24gSURzIGlzIGFscmVhZHkgbWVyZ2VkOyB0aGlzCj4gPiAgICAgc2VyaWVzIGJ1aWxkcyBv
biB0b3Agb2YgdGhhdAo+ID4gICAtIEFkZGVkIGJyZWFrcG9pbnQgc2VsZnRlc3QgaW4gdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnJlYWtwb2ludHMvCj4gPgo+ID4gSG93IHRvIHVzZToKPiA+IH5+
fn5+fn5+fn5+Cj4gPiBPcGVuU0JJOgo+ID4gICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29m
dHdhcmUtc3JjL29wZW5zYmkuZ2l0Cj4gPgo+ID4gUUVNVToKPiA+ICAgaHR0cHM6Ly9naXRodWIu
Y29tL3FlbXUvcWVtdS5naXQKPiA+Cj4gPiBMaW51eCBLZXJuZWw6Cj4gPiAgIEFwcGx5IHRoZXNl
IHBhdGNoZXMgb24gdG9wIG9mIHY3LjItcmM2Lgo+ID4KPiA+IEhvdyB0byB0ZXN0Ogo+ID4gfn5+
fn5+fn5+fn4KPiA+IEZyb20gdGhlIExpbnV4IGtlcm5lbCBkaXJlY3RvcnksIGZpcnN0IGluc3Rh
bGwgdGhlIFVBUEkgaGVhZGVycyAocmVxdWlyZWQgb24gYQo+ID4gZnJlc2ggdHJlZSBzbyB0aGUg
Y29tcGlsZXIgY2FuIGxvY2F0ZSA8YXNtL3B0cmFjZS5oPiBhbmQgdGhlIG5ldwo+ID4gTlRfUklT
Q1ZfSFdfQlJFQUsvV0FUQ0ggZGVmaW5pdGlvbnMgdmlhIEtIRFJfSU5DTFVERVMpOgo+ID4KPiA+
ICAgbWFrZSBoZWFkZXJzCj4gPgo+ID4gVGhlbiBidWlsZCB0aGUgc2VsZnRlc3Q6Cj4gPgo+ID4g
ICBtYWtlIC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JyZWFrcG9pbnRzLwo+ID4KPiA+IFRo
aXMgcHJvZHVjZXMgYnJlYWtwb2ludF90ZXN0X3Jpc2N2IHVuZGVyIHRoZSBzYW1lIGRpcmVjdG9y
eS4gTG9hZCBpdCBvbiB0aGUKPiA+IHRhcmdldCBhbmQgcnVuLiBTYW1wbGUgb3V0cHV0Ogo+ID4K
PiA+ICAgIyAvYXBwcy9icmVha3BvaW50X3Rlc3RfcmlzY3YKPiA+ICAgIyBbcGVyZl9ldmVudF06
IEJyZWFrcG9pbnQgdGVzdCBwYXNzZWQhCj4gPiAgICMgW3BlcmZfZXZlbnRdOiBXYXRjaHBvaW50
IHRlc3QgcGFzc2VkIQo+ID4gICAjIFtwdHJhY2VdOiBCcmVha3BvaW50IHRlc3QgcGFzc2VkIQo+
ID4gICAjIHB0cmFjZShQVFJBQ0VfR0VUUkVHU0VUKTogTnVtYmVyIG9mIHdhdGNocG9pbnRzOiAy
Cj4gPiAgICMgcHRyYWNlKFBUUkFDRV9HRVRSRUdTZXQpOiBhZGRyOiAweDgyODg4IGNvbnRyb2w6
IDB4ODA4MAo+ID4gICAjIFtwdHJhY2VdOiBXYXRjaHBvaW50IHRlc3QgcGFzc2VkIQo+ID4gICAj
IFtoYnByZWdzXSBicmVha3BvaW50IHJlYWRiYWNrOiBhZGRyPTB4MTA0NzIgdHlwZT00IGxlbj00
IGN0cmw9MAo+ID4gICAjIFtoYnByZWdzXTogQnJlYWtwb2ludCB0ZXN0IHBhc3NlZCEKPiA+ICAg
IyBbaGJwcmVnc10gd2F0Y2hwb2ludCByZWFkYmFjazogYWRkcj0weDgyODg4IHR5cGU9MiBsZW49
OCBjdHJsPTAKPiA+ICAgIyBbaGJwcmVnc106IFdhdGNocG9pbnQgdGVzdCBwYXNzZWQhCj4gPgo+
ID4gSGltYW5zaHUgQ2hhdWhhbiAoNSk6Cj4gPiAgIHJpc2N2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBm
b3IgaGFyZHdhcmUgYnJlYWsvd2F0Y2hwb2ludHMKPiA+ICAgcmlzY3Y6IEFkZCBicmVha3BvaW50
IGFuZCB3YXRjaHBvaW50IHRlc3QgZm9yIHJpc2N2Cj4gPiAgIHJpc2N2OiBwdHJhY2Ugc3VwcG9y
dCBmb3IgaGFyZHdhcmUgYnJlYWsvd2F0Y2hwb2ludHMKPiA+ICAgc2VsZnRlc3RzL2JyZWFrcG9p
bnRzOiBleHRlbmQgcmlzY3YgdGVzdCBmb3IgcHRyYWNlIGh3Cj4gPiAgICAgYnJlYWsvd2F0Y2hw
b2ludHMKPiA+ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgUklTQy1WIERlYnVnZ2luZwo+
ID4KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDkgKwo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od19icmVha3BvaW50LmggICAgICAg
IHwgMjk5ICsrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tkZWJ1Zy5oICAgICAg
ICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
ICAgICAgICAgICAgfCAgMTggKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaCAgICAgICAgICB8ICA1MyArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtw
b2ludC5jICAgICAgICAgICAgIHwgNjc3ICsrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgICAgICAgICAgfCAgIDUgKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAgICAgICAgICAgICB8IDUwNyArKysrKysrKysrKysK
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgICAgICAgICAgfCAgIDYg
Kwo+ID4gIGluY2x1ZGUvdWFwaS9saW51eC9lbGYuaCAgICAgICAgICAgICAgICAgICAgICB8ICAg
NCArCj4gPiAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgICAgICAgICAgIHwg
ICAyICsKPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icmVha3BvaW50cy9NYWtlZmlsZSAg
fCAgIDUgKwo+ID4gIC4uLi9icmVha3BvaW50cy9icmVha3BvaW50X3Rlc3RfcmlzY3YuYyAgICAg
ICB8IDc2NSArKysrKysrKysrKysrKysrKysKPiA+ICAxNSBmaWxlcyBjaGFuZ2VkLCAyMzU1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od19icmVha3BvaW50LmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JyZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVzdF9yaXNj
di5jCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
