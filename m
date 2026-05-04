Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35542CD343B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgnShhbgoBwynrZgryrOPC/OjBdzAX70hN+unUkE+mQ=; b=F5Djen92aJLQ8R
	09+q3p5kkWIBw93p8hu2RbOZk0w1PPoeg4LtOD59hINej1FJN5RGK6+PE3Zg5RI/94wy0XOAnk/Fr
	FeH2/xIWX4q0Td9w0OHHcTBREsPIB/qfsmfiTyiQMQ5ChAVZesmg2QTbeI8bMMDyahZGCvdnzrqRY
	eWAdtfe0Z/ZP/Kf7aF6YLco8w8nzFMUt+o5Oi5B9geK9US0xwoPNYHkGwuyPNtJaT3GTuzQNvMU3A
	IMbjZdPGuy+IoqSqJaODR3sw6KfcWHE+aYM61ntOu3Ax20SB1oshu2Q1X8ojZJTVWOFbFNQGb4PTn
	nNPjrLxWWazj3ps1cZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzLy-0000000ECnT-2LCL;
	Mon, 04 May 2026 19:53:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzLv-0000000ECm7-0RJc
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 19:53:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644E3SqM1187939
	for <linux-riscv@lists.infradead.org>; Mon, 4 May 2026 19:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=; b=puq8KFDGz9s1l076
	9fXvFzlevSb59poqwX3Xls1uQG6DW+ISL7h3hkc/3hZ1kWmKGTyoV6qJCkQ454/H
	8BdaTU5vSoZed3aSBRiD1GtSqJSeJEPXm06SPmDlI6hcnl+MVMvgiX/MIxoDBPyE
	702HJV7wx3rT4otbew5lO5juRPdZIqP2zY2hgN2admZc+RW1r+nhojPZ+6X5Sq9a
	aQb0hRHpUhkBfqSjn3y5zRENpG6j+sIzjUFXBAVORKwljL1nuRLf/Yd3YN8KVFMQ
	d2n2c8YET6REnQeK1c+ZfBfRED4qxKk7MrqVMvkt5iIeV6is4gi9LBrXGo2cApxo
	0EJtyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvg9d4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 19:53:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so5843162eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777924392; x=1778529192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=;
        b=EQCLokRXoEdY59cIQ0CJAIiA4AMkyn7LZIDQQEfbKsVRHOphXylpeoW8KiTN8OuUap
         M2P//p+1zU1qWJrjoUGyNXtK7Io+xC/yQmpMqPAfFrwAMDrm+D2Y4lxwxjL2YQLe2691
         qQOZLeP38KJbOuzydJ/qe/ZEllaSJqc+S21F8eV4/6Xe4Rbq3IZ3MC+6iwR9kQwWAJo4
         E5kd5WHNE2u1uDFDm1RA/oh1t1Cj8tJUTZHpAjoTwn0h4cmRUhPlVFlJFH5ximK2airU
         qs908+lMcLUV+G0wChpOnVEWRHgQGSlFdwx85HmafwhMhrwmfe+qIEZQHrdRsG3dJjYF
         SYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777924392; x=1778529192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=;
        b=bjLFtWkORJ5tvrreDIzFr1J21etFb71BQVTmgmZU4hkVly6vPAdz+NnyJNs/P592v6
         t7MJ+EdZ95od7Rr6SVYymhDtJ0FYZsyHY7VXfK05nR4yB232tcYMvNIe6k86nNZZsp8u
         CDAlvjtJX/ARW6PNSsg1VjGXU2VqPoFD/EGujsVdKhwey5IyAla4x264gLsOCTDjmec1
         hqCW5QlpUFYRg+GkfM6rfD+x8MpTPm/RQKQ7Z1Ol/z/uPdWqklCCK3LacRqTRdC9P6B8
         uFYG4GdtnknWZC52y/T/7di/uUpy9m9U9HanlbkGxDOoZQqju94EWNQiaNn2JMVcBojb
         CGFw==
X-Forwarded-Encrypted: i=1; AFNElJ+C/qHwNcyggPtUXtpfyc/Wnt7jcbgFSkWAQwKzWViDLcs+tWeMxwjpaTZS8JdYCCkl2DuYG1ELIad7SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyA9818V17FyUWpJZT9BV2NdPYQPB+Krdm2bniFX2GmX4b4/fV
	TghjMwpOSUzqdKjkvrzzQY1kwIj425aRRk//IHiOYGRwS0Zi8NWnAekahi6Hd2O9I6Wk0/+CINj
	73CnjoZsiK+yoD/jKKAp7NG8a16lQjssJnPIFCn2uNcz2MvMzXML9GE3ngpOb9lM+1S0FWKY=
X-Gm-Gg: AeBDieuSvjQ2O991ivpCPUFGIyaWIlzWyBzN6WClS7pzQ/vh4eIjZXs6iraYxDx0wvv
	bkxBsE14JmPYlsKWvS4JoZAJC8o7XYbxus8zByWLL5HPVJuJr8Tx5aclvzHhcbDKQJ5+aReJjOO
	BX5esTg4V4tZMleMRiJc7Ciq51gye1fPOiPcziG7qValuo76Jjx4KoAqtNIh9f34X4GioWPGRzt
	a3O/NCLN1d2tgwrg7+38KvLu3bd2/MDKW4Ipn2Y2J9YQJ7Ru7I4kAEy/aOpHB1jev3IYIItFbo2
	FvqW+1fq7gbhx/MHZlxJ2rKZZ2Xr+OWOUPO2qf3QoueRSSHItMlwTatbVd4kfCOI5pJ+IbYbBp9
	wMk6Wu79ayEhajUvZXBBLViS8jUq38TfgXGwTjgkM
X-Received: by 2002:a05:7301:678f:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2efba17a51fmr5429712eec.26.1777924392213;
        Mon, 04 May 2026 12:53:12 -0700 (PDT)
X-Received: by 2002:a05:7301:678f:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2efba17a51fmr5429683eec.26.1777924391681;
        Mon, 04 May 2026 12:53:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm17660932eec.22.2026.05.04.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:53:11 -0700 (PDT)
Date: Mon, 4 May 2026 14:53:09 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] iommu/riscv: Add hardware dirty tracking for
 second-stage domains
Message-ID: <tdcd7276ffsfc6vh3expyfcajnfkowknbtkpyplb3xe3dcukj2@tnhi6jcwrfgn>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: eEcFDXbhJ_mBcVzHkflChR4FQ_aM9LIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE4MiBTYWx0ZWRfX7jQGMhFSs4KR
 8qZrOf50egcVYqt0ieXn9A3LDta4Ufx8NQb4jAiblBVadaDQExc0gOgfCzqDn81u0sDLO2+ALNT
 b+p2vZHeF5qMHVrrDLYDUPIEQnMsYAOpAImvAt+eyHTq6XerBOO9Jiz8puK6piRjjoTcYyk0o0I
 Dcg+fm9iaqGmvTf5tYwkyJ0UEWSq2k1YGw7yp4CEhSEWjbwnZ+X09/zBwCxCd7FHil7lTpW5cyz
 mIge3PrX0n3BJgcooNOuaepdhu0kPwWTAEEbU39exgvO9ukKG5AWuyLLdQ5LbeVFJ+ybBILL7tw
 1L0RYQTUxSAEKV6MULhctl4rnUfkIwWFFEw/meytsZGeFRMFN7P6m9Y4hxpo5s6i7/oo4vwfq7X
 nceoaj4sM1hanSSY4GjeatpDSwF8zsLxZidndgmyqMGOHCMFuMS+RNgt+v6OZ1qRN7BDGuWj1J/
 6OMQDpzUczGUBl5hhkQ==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f8f929 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SRrdq9N9AAAA:8 a=O0cgCnXdde_TIKaFu4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: eEcFDXbhJ_mBcVzHkflChR4FQ_aM9LIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_125315_284925_AEBF4B38 
X-CRM114-Status: GOOD (  20.61  )
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

T24gVHVlLCBBcHIgMjgsIDIwMjYgYXQgMDk6MTM6NDhQTSArMDgwMCwgZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tIHdyb3RlOgo+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPgo+IAo+IFRoZSBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJlIGRlZmluZXMgYW4g
QU1PX0hXQUQgY2FwYWJpbGl0eSAoSGFyZHdhcmUKPiBBY2Nlc3MvRGlydHkgdXBkYXRlKSB0aGF0
IGFsbG93cyB0aGUgSU9NTVUgdG8gYXRvbWljYWxseSBzZXQgdGhlIEEvRCBiaXRzCj4gaW4gc2Vj
b25kLXN0YWdlIFBURXMgb24gRE1BIGFjY2Vzcy4gIFdoZW4gREMudGMuR0FERSBpcyBhc3NlcnRl
ZCwgdGhlIElPTU1VCj4gYXV0b25vbW91c2x5IHNldHMgRCBvbiB0aGUgZmlyc3Qgd3JpdGUgdG8g
YSBwYWdlIG1hcHBlZCBieSBhbiBpb2hnYXRwCj4gZG9tYWluLiAgVGhpcyBzZXJpZXMgd2lyZXMg
dGhhdCBjYXBhYmlsaXR5IHVwIHRvIHRoZSBpb21tdWZkIGRpcnR5LXRyYWNraW5nCj4gaW50ZXJm
YWNlIChJT01NVV9IV1BUX1NFVF9ESVJUWV9UUkFDS0lORyAvIElPTU1VX0hXUFRfR0VUX0RJUlRZ
X0JJVE1BUCkgYW5kCj4gcmVwb3J0cyBJT01NVV9DQVBfRElSVFlfVFJBQ0tJTkcuCj4gCj4gRGVz
aWduIG5vdGVzCj4gLS0tLS0tLS0tLS0tCj4gCj4gKiBUaGUgZmVhdHVyZSBpcyBzY29wZWQgdG8g
c2Vjb25kLXN0YWdlIChpb2hnYXRwKSBkb21haW5zIG9ubHk7IHRoZXNlIGFyZQo+ICAgdGhlIGRv
bWFpbnMgY3JlYXRlZCBmb3IgS1ZNIC8gVkZJTyBkZXZpY2UgcGFzcy10aHJvdWdoIHdoZW4gdXNl
cnNwYWNlCj4gICBhbGxvY2F0ZXMgYW4gSFdQVCB3aXRoIElPTU1VX0hXUFRfQUxMT0NfTkVTVF9Q
QVJFTlQgb3IKPiAgIElPTU1VX0hXUFRfQUxMT0NfRElSVFlfVFJBQ0tJTkcuICBGaXJzdC1zdGFn
ZSAoaW9zYXRwKSBkb21haW5zIGFyZSBub3QKPiAgIHRvdWNoZWQgYnkgdGhpcyBzZXJpZXMuCj4g
Cj4gKiBUaGUgcGFnZS10YWJsZSBzaWRlIHBsdWdzIGludG8gdGhlIGV4aXN0aW5nIGdlbmVyaWNf
cHQgZGlydHkgaG9vawo+ICAgZnJhbWV3b3JrIChhbWR2MSAvIHZ0ZHNzIHN0eWxlKS4gIFJJU0Mt
ViBhZGRzIHRoZSB0aHJlZSByZXF1aXJlZCBQVEUKPiAgIG9wcyDigJMgaXNfd3JpdGVfZGlydHkg
LyBtYWtlX3dyaXRlX2NsZWFuIC8gbWFrZV93cml0ZV9kaXJ0eS4KPiAKPiBUZXN0aW5nCj4gLS0t
LS0tLQo+IAo+ICogVGVzdCBvbiBRRU1VIFJJU0MtViwgYSB2aXJ0aW8tbmV0IGFuZCBhbiBlMTAw
MGUgZGV2aWNlIHdhcyBwYXNzZWQgdGhyb3VnaAo+ICAgdG8gYW4gTDIgZ3Vlc3QgdmlhIHZmaW8t
cGNpICsgaW9tbXVmZC4KPiAKPiAqIGdlbmVyaWNfcHQgS1VuaXQ6IHRoZSBleGlzdGluZyB0ZXN0
X2RpcnR5IGNhc2Ugbm93IHJ1bnMgYW5kIHBhc3NlcyBmb3IKPiAgIHRoZSBSSVNDLVYgNjQtYml0
IGZvcm1hdC4KPiAKPiBGb2xsb3ctdXAgd29yawo+IC0tLS0tLS0tLS0tLS0tCj4gKiBCdWlsZCBh
IGRlZGljYXRlZCBlbmQtdG8tZW5kIHRlc3QgY2FzZSB0aGF0IGRyaXZlcyB0aGUgZnVsbCBmbG93
Cj4gICAoSFdQVF9BTExPQyB3aXRoIERJUlRZX1RSQUNLSU5HIC0+IGF0dGFjaCAtPiBJT0FTX01B
UCAtPiBnZW5lcmF0ZSByZWFsCj4gICBETUEgLT4gU0VUX0RJUlRZX1RSQUNLSU5HIC0+IEdFVF9E
SVJUWV9CSVRNQVAgLT4gdmVyaWZ5IGJpdG1hcCBhZ2FpbnN0Cj4gICBleHBlY3RlZCBJT1ZBIGZv
b3RwcmludCkgc28gdGhhdCB0aGUgYmVoYXZpb3VyIGNhbiBiZSByZWdyZXNzaW9uLXRlc3RlZAo+
ICAgYmV5b25kIHRoZSBLVW5pdCBQVEUtbGV2ZWwgY292ZXJhZ2UuCj4gCj4gKiBJZiBwb3NzaWJs
ZSwgcmViYXNlIGFuZCByZXRlc3Qgb24gdG9wIG9mIHRoZSB1cGRhdGVkICJpb21tdSBpcnFieXBh
c3MiCj4gICBwYXRjaHNldC4KClRoYW5rcyBmb3IgdGhpcyBzZXJpZXMhIEkgd2FzIHN0YXJ0aW5n
IHRvIGdvIGRvd24gYSBzaW1pbGFyIHJvYWQgbXlzZWxmCmluIG9yZGVyIHRvIGxpbWl0IGlycWJ5
cGFzcyB0byBJT01NVV9IV1BUX0FMTE9DX05FU1RfUEFSRU5UIGRvbWFpbnMgc2luY2UKSSB3YXNu
J3QgaGFwcHkgd2l0aCBvdGhlciBhcHByb2FjaGVzLCBlLmcuIGNvbnRpbnVpbmcgdG8gdXNlIHMt
c3RhZ2UsIGJ1dAphY3RpdmF0aW5nIGctc3RhZ2UgdG9vIHdpdGggaWRlbnRpdHkgbWFwcGluZ3Mg
c2luY2UgdGhlIE1TSSB0YWJsZSBjYW4ndCBiZQphY3RpdmF0ZWQgb3RoZXJ3aXNlLiBPciwgc2lt
cGx5IHVzaW5nIGctc3RhZ2UgaW5zdGVhZCBvZiBzLXN0YWdlIGluIG9yZGVyCnRvIGdldCB0aGUg
TVNJIHRhYmxlIGVuYWJsZWQuIEluIHRoZSBlbmQsIEkgdGhpbmsgdGhlIGJlc3QgaXMgdG8gcmVx
dWlyZQpuZXN0ZWQgZm9yIGlycWJ5cGFzcyBhbmQgdGhpcyBzZXJpZXMgd2lsbCBwcm92aWRlIGEg
Z29vZCBiYXNlIGZvciB0aGF0LgoKSSdsbCByZWJhc2UgaXJxYnlwYXNzIG9uIHRoaXMgc2VyaWVz
IGFuZCB0ZXN0IGl0IG91dC4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
