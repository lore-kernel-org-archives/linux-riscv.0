Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB16C61DB9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDUokDIErqcF970xhE900If/QCZ+KAd7sMV5d+cRD5I=; b=vMmV1b6eGwAn7w
	S8ch0KA4qpq/H42iAJfrScd1YBKQweO9lu3rFJm6/48hsOexNcNydyIvCeFfRm2HhDYuW6xGkxnH2
	tX2OIzFxT2sFwUfkhbf2zPhxmgynzQ4MggZToqfzhmgAptqcP+vHLnGSSpQuLqk/EIcgSPcn/K5pU
	XOb1aMVidTXrBTXJ0rhG123rYpKgvOOLTEKS0G566OosohhAI7MZOYmzwRm8CbANXQolCdGCtvn3+
	hD8Wu8XZ6kXWCh4nLJoVlepswwt8M0/JEcn80WF4xVDAWE9c9fsD1N3sDMgaSxL9uGwZJ/HlzZfcR
	yopBbJiRTjtWVhSR3fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr8K-00000000r7f-085u;
	Tue, 25 Aug 2026 13:24:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr8H-00000000r7E-2ftq
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 13:24:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvUaf1259496
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LC1OvcR1kST+YRmHVQ0IkWyZ
	cirgHHTZlqqw5HLd9QU=; b=M3YsHFXFw1WaNeSwN+bWd71uBsAwu/uhH3u16X1T
	mt4GwIlJsX6z40t42SaJOrxUVxmGnCGYMspTlQv+nkDHcgcg6lW2IC6E47OdxlyX
	URB3xfM3lbnDAwHbYaC/cBCk/xVO9AQKQ+NDzmgJYCgXzkOw3uj/0OocT63RERy3
	hpXEYxWMIXmxT+8Y/I2u5a3ijrHOnl7v7bbGBdoOBhFGbEfvJ5OuZ1aHH553PCo9
	fDIPht3kbW75Nsc92S6O0PCfccbdVXo+b3Mx0MaSf0l1ITW0PPnUj4PylmAoHeMj
	6im9PkRIJtSTFRL5EeUXQZQO5bz/mHx9GmN48tY4wIjTkw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp0v7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:24:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so54282571cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787664243; x=1788269043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LC1OvcR1kST+YRmHVQ0IkWyZcirgHHTZlqqw5HLd9QU=;
        b=ensKjAkTAYhtiog1zAQ2cd8CqnAW7lYDT5W/NsViZTUiiOPMeLFkzXot8qLwYOhFTv
         BenjX7xfrfITNZacke+3S00VgQmRhdpSYF3ITgYOJ3EEOfqx4yU7hT5PWqUAm9AHdX4O
         gGeaVptD49Bbzg7wSilzFu3Wmcctj0oiRiVOsYIC/krtH5perdtALxhYXXzqj2yqUVBe
         7gmnIbuFAUK4DwysiujrFWRIQDQ088T65RcEwcnxxRsoIr1jPLIgWxwIE/UWWvvTmU21
         K16u6W8zQ1M4smhXoeeUkSCb0peUHH/MeblVfkGxaZ7aEV0sVGEGpuWaf3b2d35icbEK
         0JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664243; x=1788269043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LC1OvcR1kST+YRmHVQ0IkWyZcirgHHTZlqqw5HLd9QU=;
        b=MK3khcNYt2LibAFE571VqGjuHSzJluha+7M1hMEwfFabLBeCur+rSPX9VZ7DBUAgEo
         wB+QmTP/JuYXZiSCAL6pLB434mzEgYzhfjVFQw9q/SRLvK83B2+d15Xp7cYp8oFqA+1w
         rkK1uMdcrMXw+aYNFxI13z/8dzFnwBnqHEG3vvUCngb1nQGZTXxXiEmoWxEgRgNqcNoA
         tQWtgpkQqJ3iRoZwV93cnKxUqMRiDqBcFb6WHM/+mcq82TCxBTL/P/WlyxkGDM5S7o+w
         npLaDhdHHzKynbFMl0prbpnpYI8qRr8FjMjAswO3Oi7yUWz88j8oN2lKhKqtbQPF9OiA
         on6Q==
X-Gm-Message-State: AFuF++kJo1O9J2MR7+1eTSqNO1Jrq5qOeu/A5CZzDQ8dOILaRFQZS1P/
	02DP/DXIJnmnKIvJjucvSVdDMNAraVtAKNMe22ydpzy6zK8tF8a+zSaxNtaOcWdns0x5h5pvuwS
	EW92A1IZU1rjaMg3635DKcfNFBL+zVf8/ApqJgcK1DCVllaspQjeDCvq/cswWfFEymHd1oX8=
X-Gm-Gg: AR+sD12rReIZ6husa+Mi9VBFZ8z0nj9jWu0zJRBOC7mfXZ/Z0+D+aq7z0Rm705bOsoA
	xptjmu+mN+GufjQSV/OS4i4idomqr8ejc/Okb6gaeeCbvilIzwCmsaBy1CIZC3jIQ17a2UnMIRd
	Jroh6+xuVqNMz0tYogwY0NwlPlaBmm/Ad/G9XsweSjof+yvoOyrItytRpTF9KShT4lhWJm7E9UL
	J3J8CBqij3c0IexlY7+KkhdDG8RGySiYrbOQOhP/9axnMrijsgH6bFjhcfD0hI4fKbZEdfP8MfQ
	SQueuB7BAnGayl7hiRnTZ6z/mNgD8VWgeaZtqXibdMWI2NGRXYje/0Mb3jHnzei87iSXTyIXPOS
	MMvH8LPtBBb5fwrzBRRg2JuC6KWJ+WxueWnk=
X-Received: by 2002:ac8:5fc1:0:b0:52d:8257:666d with SMTP id d75a77b69052e-52e2f0881ffmr69685881cf.11.1787664243223;
        Tue, 25 Aug 2026 06:24:03 -0700 (PDT)
X-Received: by 2002:ac8:5fc1:0:b0:52d:8257:666d with SMTP id d75a77b69052e-52e2f0881ffmr69685321cf.11.1787664242729;
        Tue, 25 Aug 2026 06:24:02 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295632sm2014052266b.18.2026.08.25.06.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:24:02 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:24:01 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
References: <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
 <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
 <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
 <20260822140625.GM244917@nvidia.com>
 <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
 <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260824170417.GR244917@nvidia.com>
X-Proofpoint-ORIG-GUID: VBHO7qfUNwpKPfhj77-MmZ-uHsjfBe1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfXzx3Ebiwck8bO
 6iNxD/vaQZmHCWwS9knBY1wdeti69gcOVghLGdJw1MnjTxjK9NEOUuAA5k8aVhbBL6qYshhsQNC
 m2yHHp/Ya4FI4cZTGqAPRcTyYVn6VP8o723t1CXXnbwyyl7AgHgE8i4w/lSBFC6hfH2qwK/oePE
 RjDj/h+yfP0zwMl0Xkjy1ea3GrfwOKM4YJ52JnrJ+kPpvAUyTCHL8TVmghv3yRSxwMGpaAMXZAE
 FjhR9IK84dQhAyHQedFlmSrtJB+mz1iAyZRNzF/wFkjKU1JanoMs5eb+8gjS8OL0fxB0SRVbY+U
 PWS1d0huY2OqOuVNccfvXIFF/zPTCesOkFPjwMhu73dBVrwNeyrup5nIm9vjm22OJWqdR5Qnh6Y
 W02n1rd5/0Oj09OxrC/92yg4yXvB0kcJRdvPfyaBD1DDDm0QIBwEFZ4x5aYUQLstbu+Bi92e7T7
 F6/HfmpN2BADFDvdGFg==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8d9774 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=md2Dys26qybDbSo3kC4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VBHO7qfUNwpKPfhj77-MmZ-uHsjfBe1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfXxf7pKh/0NYTP
 5v+EyDxBdNo5eofcWoWB2yAi4yMogvH7beGIfT46DBUcoyfeHHw/auk4hEZVYGiGYtCbZv/9i65
 Tn/tGuTigO4ZdrKFBD/9boetKcXoJu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_062405_715874_FAE3E53F 
X-CRM114-Status: GOOD (  37.33  )
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

On Mon, Aug 24, 2026 at 02:04:17PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 24, 2026 at 05:43:19PM +0200, Andrew Jones wrote:
> 
> > VFIO cannot silently switch back to host delivery. We need plumbing
> > to establish a guest-owned MSI mode, preserve and mask the guest
> > descriptor across the VFIO vector lifecycle, and stop or reject the
> > configuration if that mode cannot be maintained.
> 
> Yeah
> 
> > The guest descriptor itself is already available in
> > kvm_arch_update_irqfd_routing(), so RISC-V still does not need to
> > interpret or track the guest IOVA. The IOVA can be written directly to the
> > device (since the IOMMU MSI table is pre-populated with all vIMSIC GPAs).
> 
> Yeah, and now you are getting in "fun" land about how should
> information KVM has get shared with the IRQ subsystem and irqdomains
> (?)  that need to use it to make decisions.

The interface we have is irq_set_vcpu_affinity(), which is a bit messy
to use for everything. ARM uses it as a command interface
(enum its_vcpu_info_cmd_type), and the RISC-V irqbypass prototype is
currently following that example.

> 
> > Indeed, irq_set_vcpu_affinity() alone will be insufficient for two-stage
> > guests due to the VFIO vector lifecycle concerns with guest-owned MSI
> > descriptors.
> > 
> > RISC-V does not need S2 page-table mappings for MSIs, though. The VM's
> > IMSIC topology identifies the vIMSIC GPAs used to populate the MSI table,
> > and an MSI-table match bypasses the normal S2 page table.
> 
> Okay, so that's an odd twist, you won't need to get the physical into
> the S2 then, but the VMM does need to reserve off a hole in the S2 for
> the MSI table to land and manipulate the physical through a parallel
> translation mechanism.

I don't think we even need a hole. If, after S1, a GPA matches the MSI
address pattern, then the MSI table completes the translation. If the
GPA does not match the pattern then it goes to S2. The VMM already
reserves the vIMSIC GPA range as MMIO, but it doesn't need S2 mappings.

> 
> Then that means if an irqdomain wraps this translation it is actually
> a *per VM* domain with a *per VM* translation, sitting on top of a
> bunch of iommufd viommus, somehow. That's feeling pretty weird now.

The irqdomains remain per-device. The MSI table belongs to the
corresponding S2 IOMMU domain and its configuration is bound to one VM's
IMSIC topology. The current prototype rejects irqbypass from another VM
once the table has an owner. The irqdomain does not sit on top of the
vIOMMUs. A vIOMMU links guest-controlled S1 domains to their S2 parent,
while the per-device irqdomain is the IRQ-side entry point for updating
that parent's MSI table.

For the host remapping implemented by this series, each irqdomain is
per-device because it is inserted into the device's IRQ hierarchy and
provides MSI remapping through irq_compose_msi_msg().

> 
> > I agree there is some new terrain to travel here. It'd be great to discuss
> > this at Plumber's.
> 
> I would still try to get basic baseline support landed for a 'bare'
> translation using a RMR (?). That doesn't require any new inventions
> at least.

Working on it :-)

> 
> Then the question of how to support a S1, guest controlled descriptor,
> and per-vm vCPU to pCPU remapping table can be clearly articulated..
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
