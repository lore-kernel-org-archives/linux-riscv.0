Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD5606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kywsQJtb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3rH5ta5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uvnWx96XKfflxZT6open6RdmgUfXTi8tG4co0YO92kg=; b=kywsQJtbznAWi9J1JYuDb6QeKP
	xBvo07fv5s86/5zUopA+D9ph1YMtv3SBQ6INWXAVfoScZn9EWqlexStruoyu+P9wKC+tvznBmiHzo
	ku8nmeB0lmA44AaaftGJnomHOdyr2FxemYDUr+itxZBqwiYHTWh7o2UXAs+6CMjkx4f75mKAmJN2y
	exfNDMetmfjxwXG3RjoL5glxcAiHZZJKIqXQwV5Zq+OHqvbRoUWwNS8s+S7nWK9g86/2KoiFqYub8
	nbkmKAtU8WVGKftK08tm1uP39J9cPJlhF0HyAvagpwxuLQy1ALrHBVHvXuMbdXyPSO9BnSxyyDpu2
	puggn+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlyj-0000000ABoO-0u1n;
	Wed, 18 Nov 2026 20:10:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlyg-0000000ABm4-3wNz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 20:10:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJN1XB059846
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 20:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=; b=ZPXpFQzUH6AbsOlY
	tF+ixoIdQ0jj1ae9RM7RCJctNoMbRbIbkMVris6T9wG50ovBmYKYEXHpBN8fVsZN
	B+hlLh1IKIylfzWhm069dLbohnT5QEkpRn/qgJP3A9cK6SQGxVDk4docSmvQgmFS
	gr8o1vTmh0hl3gwg7hmFk/7LjZnJcScYD6A0u13mf8wGY0V9bsaGY7RUV2opoDG2
	5qa8lXB54PX7bMhiQZ61HVmDa0vDI8jqXk8aTDUD3Lr5MHCTiWCDLbQF9VuVMZuj
	NBTRTVKCXtI9u6oLZabbjJNzUI7COsbnFQ1e4d+c4CDlPwuUkDU0gqrN3nXDozug
	mE1tTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg11dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 20:09:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso238451185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795032597; x=1795637397; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=e3rH5ta5DD5f9M6739qq7ulQxZMSBrxBtB88w3b9yrpTtO0KPc/iephPiq6Tfk6NUA
         Z9ZHbpnrsKs9RIV2pRW0zlZ0c5vv4cgtInuC7K4pbz0aRsySbhq7BsvwQ823W5ffor6I
         xjcYvo/kBV0mKjjxAg2cOpl8MB8EdDOU0Jzib6Nc2vVGQL5ZthZEO0te9CZLqFDQqY6A
         4swk3Tak03vJ90k6jc5RxSdvoTVOJAu3xZgqCbJ06vvWPtAcSHSd9PmrpYVH6vxuhAt+
         JCKZ03GdhCUkbB1b/F6pCHLQUlT8FFUgV2jFjIKq1CE1aud/eVksmllTIpm3kzPzocJ1
         gcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032597; x=1795637397;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=UZoRkCqJqeDBkJJsnXkQFBkgX/OM48MXoevoSTgzriPIMTRfjAKvEU/QSgR+7lBjcL
         jIY75BacntXX22p0UwVSKeVuKpxAWvH6QJ01loF7RLFmD8xFSLZkwh2hV6dMGPlXRnZl
         4/dqIGeRdx77tInd1JAKZMcu09PWVW/r/Kh+yr0NVQZgKXP+ZgOsolNlZHMQ4pCmlWxS
         f8bibqjTXiiiM5CBTgZOk0rHLHy66cN8asC9Y0BXt+Ubg3AcRxesNElkx3ucbtOE5AR1
         4XVc0llRtlW4rG4unBbei++1+p3ac+e9jogyss0vr2l0OcxGDnqC6oBKvpgfp/c7L+2s
         2lcw==
X-Forwarded-Encrypted: i=1; AL+hErHvzUDeyBxZlMG2Xf0JCUj5UQhDDOwZ4/deP34sUfj28QDus4Lajdps0UF8oJZRztun8DfsAFtMPmDZEA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8LTJirUVO7I4CIq0DuptHA9l3/xdkpgIKf7YQOJUqwPMaJvsoT
	RIEEqwTOU/fueB7uP7vf5Yu3k/TDlMplWJQWPVLRJ5gI6Yt18zllli29QpZBY4aWaTVxUY2JkUE
	F4SCnPE/TPo6sMtME3L2PBneI7jTq1Go4+5zgBhoJBcsmkvwWxVsJEvr6Kq4KFUL8WgWMurU=
X-Gm-Gg: AYBFou3YgeeTyURPNS38w+5UHkeyMVxkXIACbzIWyZorBvDFc5eaxy9CxcWWuWfE3F1
	dE7QVthReA7xs6Mux3SiVD/jaCBEBvr8gmkjlf3ozzKXNBA0ezlwTq/9tGHzvW4E9w2rAxsWfsV
	1WtChoZtbJdx+5FpjcSv1WoDRW2DmRyeg+6B9gCK4c0sysfNrZ7g/AnF9jVN7TOH8L0mj/hABez
	j0UGseSXOZtOVOWBsTKLX/Yo19+kJv/3aKQCUHxpB8b5B4mqFbDdhRx+MzvO1mK4olzWrmd7WGT
	mp6xCyE88zuSdAPJZ8r4rZWOTUz7F3Kw/PhYuJ7HNesmKHKqAtB13UKWhY8cQqYufVfM4ukOvuF
	cpEAtJlX7GmlwzPOz5Tbqr6ZZNU8NU3ao2Fz5YIj5qTJArZrnra07sy4BBqBmcrfi7yW3S2fnqE
	bUtYZExJeO7tlZeQ==
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677403285a.28.1795032596744;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677395085a.28.1795032596062;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
Received: from localhost (ip-62-245-98-165.bb.vodafone.cz. [62.245.98.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6840078f8f.47.2026.11.18.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:09:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 21:09:53 +0100
Message-Id: <DMYLY5JOE18Z.2CQQGB4INJ4RH@oss.qualcomm.com>
Subject: Re: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, "Conor Dooley" <conor@kernel.org>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        "Andy Chiu"
 <tchiu@tenstorrent.com>,
        "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>,
        "Jonathan Corbet"
 <corbet@lwn.net>,
        "Shuah Khan" <skhan@linuxfoundation.org>,
        "Randy Dunlap"
 <rdunlap@infradead.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>,
        "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
In-Reply-To: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-Proofpoint-GUID: xMWMIkoC1_sRqiXlAFcadIgtvMB8KTwq
X-Proofpoint-ORIG-GUID: xMWMIkoC1_sRqiXlAFcadIgtvMB8KTwq
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe0615 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Sz50MssrUYSuVvM2sb41rg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_3qaHc-GLK8r7rxdq84A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXy8BCyiDnp8PZ
 XKA/cRaRPGsV0kxrH+qpjwlI8oYXC2p5rNhyp0Kp2JoxEaWA2vBLXj9o9vCTNHPvzpAuMmuPszM
 0rxkmgvKz7Ije4H3KbFMYBfpfjUgu+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX67CFJsJYMLT/
 LUYxkTqz+AXQg3LC9cOMB6p1FPOdztdNXKPaLdjHjCtyVJpiqG0NEEFWB11VrxZ0N7ZF+coGX27
 h8H6/7/vpTsEkzVHnH/GenfKLgFnyp+d29oAvDc+XZloSTZf/qyAV/Lmecm+H6jYe3JW4n3pIEP
 gO9nsuyp+49cI/emGdz9HKr8sfd7iRfLA0aI0SfW1VO5sE/MyMJ/InkfV6A6xvw3ge/5Bu1oeC4
 Z+0eslgrJ/DI8nKVVhHYCdnbtvw8ahgL14O2hpQxhoAgQD7ytMMs2axNzf3NU15PNC8Hxb5KbaB
 9IAnRZ0UQrGghjUvrZUQQ/5UHf2xA/Tdcknf26Z5KJM5FT8NuFb/SyKhAD2EOZe3GczblWFa5S/
 Q/6WhE2aaM8AAk6PY7n3lNSAmMq0FijC1rEJ6zpt+kkUqY3o4YuCA8Z9Gdp1XBNIWixcPwhx+j7
 1P9TeWKRSA6hIDcHg+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_120959_105082_2DBA6706 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-11-08T04:42:01-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
> composed during setup_arch(), while riscv_nousercfi is a __setup()
> parameter, and those are parsed from start_kernel() after setup_arch()
> has returned.
>
> As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
> riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
> the ISA bitmaps even when user CFI is disabled on the kernel command
> line.

(I thought that was the intention.)

riscv_nousercfi definintely should disable the hwprobe reporting of
those features (my series did that), and prevent their enablement in
user-mode.

Why disable Zicfilp and Zicfiss in the ISA bitmaps by setting nousercfi,
though?  Aren't the validate functions just misusing riscv_nousercfi
instead of defining a clear detection mechanism?

I think the ISA bitmaps should consider whether Linux has the
extensions, which with standard SBI means a successfuly executed FWFT
set/get.

Linux can then use the ISA bitmap to decide whether to use CFI for
kernel code, allow it in KVM guests, report it as available hardware
feature, or allow it in user mode.

nousercfi seems like it should only restrict use of CFI in user mode.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
