Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB026C5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb7MTpPecAEn1DMikHoSxh3b/ThoWZ/HTJ/8FKJZe80=; b=SCbTM3pfzkPw/C
	PWw9pVlfuxB7KpnhC7DaIZhnYHTDsIQ/vjdTTWNwcCU6e4BAEDsUEdt7kxZb6WywvPL/WeQp0x+P/
	S1N+5r+Jsbe1+Gcpyz2NN4Wa/UZM34lPvYIjtZEWIt166OEYxsCdkSdhdZk1ayBTROkOjfzWCcDPE
	928Ssa5Uw3hQRejJcSAEUp27fV73BTMJK4OZ/WQp4k0rueOoA5Uvm4hJ6u90+x+Ni9OY+83pgDgp6
	muqhPMyjufcirZT/F7l693yz4RFHP/wkMyfvkqDyo1UQ68Htm1Kx+t6ejXB9SK9Kc+1I0NaV1MshQ
	C+KFu6ug5OYRz9TUyydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPjf-0000000DTpL-1I8v;
	Fri, 21 Aug 2026 13:56:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPjc-0000000DTo9-2Wad
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:56:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoqHS2467509
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 13:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=208mLy3Ki7ZmUkj5X/SI6UnX
	5AP2enQuN0QqXNysB90=; b=UlQysatIPD9oDfNfH5bXZiRF20aUSbgJm1sesl/U
	ehCjC5bmYfreXwIuQMPVsfjcRSzfDOPM8jfj93DK4MwH322b9pbf/Voh905Kzu0i
	KR8CxvkfdkyNYyXPaxIoxWrR/R+jEhGbgWXeSvmfYXOHmHtcB8Xjgf1n2MJ5vsKb
	ZwrIlQIROWVjb10pUIM5WoMtHxbaDGH6RizJcNbLTzzQzXCmLBd/8bAoXHxtGGJh
	4ehVnPcsDpayitk0mFnoR2c2w78HjZ5Vzodn3R64K96rjQfvoP0I1EzSZNn9hDkf
	RuV4mI1hHdV5rFQvlwW9kT4dvvTPeoj7KVXv9JAduHNPHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddhw5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 13:56:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so12720081cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787320599; x=1787925399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=208mLy3Ki7ZmUkj5X/SI6UnX5AP2enQuN0QqXNysB90=;
        b=RuRcuJPsTXenlVXr/wxajSg9EHz4Nez514GvINCqFG3VSlgFGjg9JcbwO9imAS+VnE
         D0fO9Gst4r6CVtd+oPWTNZE5MzKs2Gdlwv5xsOjwSTdv+r9lBRUD3oyZdVyeWAYkH+hB
         UyfbReRhfKUB3CnyZ8NwF/GbWjOvFg4KkPio3QRgMvA1grKXGLCty/i8lyl3Hn60MuzB
         vtO+vTaOpCWpN+Hq2tSeN6hwo1qScmGBl8kXhcYPT0468qDt5+pR/xTepXccCrqakBy/
         LsaedjnuQRabtwWPpxftFVS1Zt8t+zLoJ8gotDyWStTIdykVyy+iPu9irXlbgFtNE+oL
         jW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320599; x=1787925399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=208mLy3Ki7ZmUkj5X/SI6UnX5AP2enQuN0QqXNysB90=;
        b=QDEAjIS00HPVr0F0C+qjQT5T1PHPqXzhPPPl42xIhNFi5+itlHeX2jFQyUPNz8/cjk
         j7oMKjcgb9tTs8KRwof/tGpCvoQy7kB6SsTNcBFqWvFMas5QnO2s4fbiD/FrUg+PWVpr
         Sn5hSZwIlY0qJcrRkfZiGmF+iNDPajKa4YA2ndOJad1WPFD9cgMlso4cM17oZSBPsDj+
         bGBPyZT55kNWxEY9g8PRXtLfsrncnWvORw44yGJVndAMEFHxk8U1FQvALOQ+qeM1qIxO
         8fZoExTxCy+58HiJdhVZ+gq352Kf108E+uwTkcntyKze7svkgiWUBULi7jHj5CTgNzKn
         ZIsA==
X-Gm-Message-State: AOJu0YwsUSDH0tefITfQpCpJxtFgh9FCz8vLOmwth0h4roofX5MVJrCQ
	1iwcCz2j6rSFwghd/NDfLgX0vXZUkFmwuLbQn8zPWBDPWhQh9LRN/kNo27kAkEO9JyVpo6UTVD6
	P0gD8sIcLPpRhBsUVKdvEcldWyjtlhSKuEf6QznEkWOaK1mihB3Wn+dbBLWJjFmuybOSZ/o8=
X-Gm-Gg: AR+sD10N3E/aMJdYWnvfEGWbbnoZ8EBLSZuBATMZ9YoBgaD9vRk9GvgnbBCrMs9tSf9
	mEQ/4NKNBpsUjUtC33uSFcUwDb6TK/LVSVF3O8GmcPStdxdrAuM8gBsUuh7O000LjDg1NboQlUe
	40H92cU9RmPcuZExWaXL9ntJ2m2bmzpM/eufFRbdsyqh9iVr0tu27I+d+j5BfZYJI6elpDQiBW0
	Lrmo7n8UXgCb6+/ZYD2po1kctS0yMleOHX1exwvanwNvw4qDOVnCObHLE4Y10FcALSer8blMoYr
	MJx/+YGWr+qVwUux+pxY0uXEb8+/VoRtHzDHGXAK65v6hC1bxnh5Q8l18P+KvlHd9rMoLslpmO1
	Y7UDc4Fhr/DMUi+1DXvjk3JfIXGkBVJD+aJc=
X-Received: by 2002:a05:622a:4818:b0:527:8770:8fd6 with SMTP id d75a77b69052e-52df5a421b1mr55979451cf.35.1787320598701;
        Fri, 21 Aug 2026 06:56:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4818:b0:527:8770:8fd6 with SMTP id d75a77b69052e-52df5a421b1mr55978681cf.35.1787320598266;
        Fri, 21 Aug 2026 06:56:38 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b916a250sm28764715e9.15.2026.08.21.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:37 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:56:36 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 13/21] iommu/riscv: Preserve MSI IOVA state across
 domain replacement
Message-ID: <6d32btsqdpuqta2bda2hr4kco7m46tmpigfcthtpgiogho2xz4@7j6eaudgicct>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
 <20260820215204.GD244917@nvidia.com>
 <wshoqx3xyz7f2jmhgbyzpkm4ppl64olswhw5u6dye7nmomkari@j2zg5ecuvsmg>
 <20260821132252.GG244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821132252.GG244917@nvidia.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX5vym/2l/38Se
 XuS/ZgyWhlxqxFwxiqX7vf4YpBzpxIcGXkcCwgL1GtavR4t2aWauEbCX3is4cJbje8M6LmttqNl
 TtxF9JYgwlJHOcgqztJ4/vWwaYEwFjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX7S3RQC2TcYml
 297aTwtGwji43yNFmVnSKfsHbVuEAb5ikp0zl9WRJoeTfevLr7s6BEjN6cBzNKHdwU5nIbVII94
 V0NsSkJmGTm1y6DVCz8WPJCdVBM7vrKlPqcZNZ1YDoatboGcI3P6JAQFOOvjIG/UlRcdMz6lgLt
 9gjaPkwGm05Yw7Cy/A4QlPUp6dtLNzMOuAkhHTmsKQ2+SVQCRgsTj+JWzGpRRlz/7Y+mY9KsZj1
 Y/UQG59Vfvrwj2ZfQ7DCHURTTPhuM50xsmGUgU20Wu+GCuAtm3HX2kh/3lxvY+TNMPpY5494v4u
 P2az/hz9LopcWplSIAY2iQ6F3xSAITyLsBCtMswL1qgIrGzCdvfsla/DVq/+Q83bnu0lR5AttHc
 o60GfR9/iZrB+8EFx+WzWGK0GTiPG7cJXmYxrfgd9KlP+pzMm09RsasA5IYOi4MAeoUeykMPLRh
 6GvFRuBYsQEsi0Uh9Gw==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a885917 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=eCfTknyUrC7K7Id0JDUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SLJV71InwtDmlMqX7pH2eoeRWTryipsl
X-Proofpoint-ORIG-GUID: SLJV71InwtDmlMqX7pH2eoeRWTryipsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065640_761751_3AA1ECE6 
X-CRM114-Status: GOOD (  22.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2026 at 10:22:52AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 01:14:39PM +0200, Andrew Jones wrote:
> > On Thu, Aug 20, 2026 at 06:52:04PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Aug 20, 2026 at 11:41:42PM +0200, Andrew Jones wrote:
> > > > MSI IOVAs belong to a paging domain, but iommufd may replace a device's
> > > > domain while its interrupts remain allocated. Waiting for another IRQ
> > > > allocation to populate the new table would leave existing interrupts
> > > > without valid MSI IOVAs.
> > > 
> > > ???
> > > 
> > > iommufd is supposed to handle all of this itself, that is what commit
> > > 40f5175d0eb7 ("iommufd: Implement sw_msi support natively")
> > > 
> > > is doing?
> > > 
> > > The whole point of that commit was so drivers don't have to deal with
> > > this at all.
> > >
> > 
> > This driver relies on that support. iommufd installs all required MSI
> > mappings in the incoming HWPT before attach. The additional driver work
> > is to populate the PA-to-IOVA lookup table riscv needs in MSI composition
> > on IRQ affinity changes.
> 
> So it is all because some of the MSI state got leaked into the iommu
> driver? I do not like it :)
>

It's a cache of the MSI target IOVAs, rather than MSI state itself. But
the batched API lets the descriptor cache one IOVA base, so msi_iova[]
and its maintenance can go. I'll rework that for the next version.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
