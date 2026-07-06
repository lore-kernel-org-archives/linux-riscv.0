Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A090C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6Evy4uVrCibSQFVCz8TppsdiYBlXw3Kef/txSlEM8w=; b=Kx02gsuH5wwbxp
	y1drCLWpn0FBzR8vbHkIGEGTJt+Np9CqLXElJ0u5ecG43kgTAFpZM3rhK2qc4i9jAFjUcvrcSzJCQ
	8Da9e3bJ7y8QQs3rJ8o/t2kvv0FwUFopxSsUG8yXZaCVflYsO3dmK0ZnEJfu7gnbRcATPQdl3fr8q
	A47DFyhmTV3MtjZ7u6uS611zDlXLhVsbIYqcYjlk+Oyu6p2i/attUBFDjTmA97FZVs6kgJh7NZVYM
	iN6+05FkSrZrrYeEk8AGCqPRpDYMIPWhf0i1AVi2D8zKEOXhN8eIeSxPWHmEcHvNxLbYfNOTnN7P6
	ds0XLPvqvnhA5NYHTZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfEt-0000000Bxg3-3qcL;
	Mon, 06 Jul 2026 09:03:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfEq-0000000BxfT-08cb
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 09:03:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66684tk54006739
	for <linux-riscv@lists.infradead.org>; Mon, 6 Jul 2026 09:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=; b=dK0gmcyLM7biMCjv
	3wFOKUN526X6Q0vlacvGoA3jp5sBkA6/E3x+LWCj7R/KiDrCaWlMzlkw8gnzuBng
	5yijy1Uc/+orpxBi7AsouImZFASF8ND2EXFepsN5Eqt6/zZUz10rs0HIVfvx/EU9
	Yo6wR7diLRbDSylQIFZnp+NKB6YDTnJqvUML4bsK5JDhGeQU48nG9/No/x6j2kG+
	PqojKc34HM+5fcYC063WxgWEBUNQqzipu1CimpVyHiplgAj7zguOywOXDGEU3WTG
	0J+AwK2CR25wHPRtcMaErzVsQ/4T6xwdsvI4uZNCqYhcjBgQgAOlTvM5TomH9Etz
	lt+JXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs88br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 09:03:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so282964385a.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328618; x=1783933418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=;
        b=C8AdiaN6jissRCfaJKRMVzo7o/+mXbMDowByZbfq0azNuLPMwbvDZj5spYLIqdHNRp
         90AllK6L6QHIESImfLzRAqCsSGP1RT5bECIRZOdsRDGfa8oqYmvTXuc3iOIpWtL8pVUx
         o6C1IbQU8jHzHonsodX6Gvj9ukyj9QxwaqWvk+KuSZeevT+Bn6Gvj0dqvwjhFGtremC5
         kypXu+VyPwNGEIYmozfYPPhqcWEPBFleZVHi3fPQpSQ19CY1ypU5kO8bjVtX0agWyqTb
         m4NDzkYBHwOmcFlzzevVhLy8RqnvAfjyrriv/wSDwJ+HzaYB/mQCRbuSfk+v4PX+k3+G
         Dgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328618; x=1783933418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=;
        b=Ka6cyy+ULGL9JvQ3T0w8wmH+ZSFlBejsf3ix4wQiNNAdJACL6E0jLmTukM93A82PG5
         hKe+ZXOvInH4f5rhTTFxDuPESr2JTLXFCZLSO12cN8S/H1CwHBi7KGnDEORxq1o/NDVR
         IG3zritmkD6kBkt9GynYaR9HlYd5ntK11Nba6HYWWkYyMHSzmIhXXZOzfyXLW9DYqKWf
         iuGOWJgFwPXZk02s0nnFYhbMJvq/TUkfNAQ+z2hMl0oPHukw8WxAMQL3auoS+x8Z1ANT
         8DRE/6SnuTe4KJOBlVWVC0EBwx73RK0Kgxks1SJfAB4Cc597DT+RNx07RhjRxOv++Zet
         1Idg==
X-Forwarded-Encrypted: i=1; AHgh+Rrpj/02+30MDE8NmHGXKWwz8CXOeFYvfryjlXzH77Z+PqoG6rbN+MNrz/X5vOCQ0VQumza+5af8IVDMEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9HxLqyjysS2fqaZ2T8+TLg3MrJDEtugO0bo8pFvEoFz6qNu0m
	clupelBW0ZI2vmeMYTbyWEBJfdVfMf0n5L46dSfjZyaeskimFrsuFYgzqi902FOpnNAVabxuM6n
	/begb4V7zwILKpOjbIL1aggmI2i4F0GKrU7y+BIOKdD/Zr77YBvF7rIv933XLY6eqibPNXPw=
X-Gm-Gg: AfdE7cm2xxVeLstauvqzc0a8kMXSJ8eNgx5M1Cmw1kNDsw/BXsR7tme7Dx/w1Ts5uB7
	GTWxWGzD0EKMelrpgETfc6iAInqdXY3oOW1ONBsgShBlAxemurZrG8JmLvoipr3aUHI8BNLLOva
	QMjrAqVx4zFykEuIaaWDY4zneOw2izS/eiwAe/jEGEqanPbJHL4xD4W7PR7RyyNGN5+oe8stDdm
	fHjs1Atx3vWOtjOdZWpjC93XslsHU+Na6aycTciu1z4mJVb3g8nyUwNjwbsgkUGjQYpswSZrRwl
	n3qRaXhJKs7PvRnpcQAUu6XZeUa4T+dqUsTEvglPZ11vBAKXwJzfSPzqNsuCCGUq7B34pggyDOr
	HBRqve8nr/W3BH2E5VUojLHuj7Q50w8xabmPMtMc=
X-Received: by 2002:a05:620a:1b87:b0:915:8d82:b149 with SMTP id af79cd13be357-92e9a3a7bf2mr1291640985a.27.1783328617695;
        Mon, 06 Jul 2026 02:03:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:915:8d82:b149 with SMTP id af79cd13be357-92e9a3a7bf2mr1291637785a.27.1783328617271;
        Mon, 06 Jul 2026 02:03:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm326998025e9.2.2026.07.06.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sifive: add missing MODULE_DEVICE_TABLE()
Date: Mon,  6 Jul 2026 11:03:30 +0200
Message-ID: <178332860259.18708.8157859220968783095.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704122230.75964-1-pengpeng@iscas.ac.cn>
References: <20260704122230.75964-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: OsW3HvI0br2AaDK6iAJ9z1So74Cgf97m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXzN18QWLMXoMp
 sXBS5Nyi4VgiPgYYXexZQsDupI+HLaEOHzMv6huzbwc2JjHZnYv0sWFiIbV5Tf7qhIBtk3d8im2
 Kybc8wxqacB3iSUFzcy42AyvY0dOjGuzD+6uJDJQ7UyvkXrqblxTcNfMfLdDr/lTVtFGTvkbr2P
 y7mXNu+z21gR3SN+Z03rLhfbhMyx7hm/URbvq8vcXbiA1uv+QxasgfDF7pmbmH7ujm+OEg0LP5D
 QxxvWWtdKGQeOJl6MywD35KOBlrMz9/KLzKIjsQbuF4Dj3yLHS4H0Lp2tK6/Gw0an94wvukoFiy
 OTjUHTv7FjlUiGC7oIPwc3dOmWGebZTTbPmSamq1XOnfYIihcE80KaNMsRUGr/xWqGLXr8ddv2r
 h1H8i8CjzghdtAbrUrmD0XfM5NR83Mxeu6VGsCkryTZEDwkDM6ZNU61RWWYNRGdCXfsBAQ4BuS7
 d0LdLGtJOdaHDB0NOKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXwYhF60ATapff
 LTmC+o1RyRGySlHeU/AQEklUh3/tiTWCNmWv4VbM60SUiNXV/IZoESoLg7tx2tzDhWvNrq3UomA
 D36w69I6e/Vk5Id1FP0VvyDufcqkQPY=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b6f6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QiFXtDutrJn2_FFymrwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OsW3HvI0br2AaDK6iAJ9z1So74Cgf97m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_020340_188795_B829C9CF 
X-CRM114-Status: GOOD (  11.99  )
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


On Sat, 04 Jul 2026 20:22:30 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Applied, thanks!

[1/1] gpio: sifive: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/brgl/c/8fe6fa0f223f44b8b869319d1b9c383749aa147b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
