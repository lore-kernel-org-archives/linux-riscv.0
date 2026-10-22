Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7C606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x7JyXZqU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aBkdRjHK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejoboR0LmcQjmKJ0RcNmfIACxLCaGoz4oEGjU5tRP0g=; b=x7JyXZqUXG0GzU
	/iAQRg6/An7kt4zyjjOvI6xmMpnPx8q7yloDJxNtkuWQEFWfDi6V5Yj/siTeDkv0oAm36ou5/WwRd
	PL3SzBuykNM/ooPABi/+beug7CV2GNBQltyBwaoEM94A/3Um5GH5jQU01oFqJPXRPdB1S63Klz37K
	8BuKY4FGR6tUaKCQfJ240Sa5VVDicVkZkJWSOiNyBqxUCJPR36ntDsOlcSH/pgvet2F1qKPw30Bum
	I4mrZqWxc8mOc+ES0yFo6BuAiyc6jPc6ALVpucpvW3X0PDXtM+AI/r/FGaUdTiYR3WBvw+Bpn0vk9
	iNPs+QUIObMl5WkGMUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJkAf-0000000DJq1-2LRh;
	Thu, 22 Oct 2026 04:12:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJkAc-0000000DJpH-2z7P
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 04:12:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jX7l2477341
	for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 04:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=; b=kp
	3I4RPGst1xBcpDpOejvDpwFc90UDpg/3VqfDe3C7cVxEJGZyCP9uP3FMgVMCJloy
	rcJJ9LyxLzNbey5T5ScvLurlEQvD6f9tYaGyEcxGoPkDLjoJMlQIDz/XtiDvKRIB
	djn9MFbd7owI6BYVETwxlQzyw6c+dzM67HcwIZFch/xPw2kWs0xFAd83hX6E2GE7
	yotQ9smROW6iN0tue04HmyDnMQaDNFJca/ANOeAVm8Rja3J8/9+A7rIZJNIn7fJT
	gbfwVY1wiKaT2UEA7FSIBNDxCWGulzxAeqt9DOs3LqaNt4di+uyTlpUMgpvKL6cg
	fgf+C1KINGYLMm7cXrMQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2kkgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 04:12:48 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so2291294d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 21:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792642368; cv=none;
        d=google.com; s=arc-20260327;
        b=Dm6t4iqTswGG1h8ZxtTZKH+GUhYD0EC7UDz4Ed5nrnEWFDSaEZWwqz+oID05mDRnhq
         92qPkPdp71zdlDIVk0teg3iOVTfTwaegwfk8C8A+g9ZTDyd4Ybgs7UC7gqz8uhZw8L0r
         ZDi7683T6asHni2ExQnqUFY+FiGu3dBjwqUrtWEaX1gW3nUOJZVUJOIPLN4V3sh2vpUe
         uNeVWulizW/XSsO2bNT4AF1Art8rDcqezUG9mH4OCCFMh6j23Cy+b08Xd5ZfbmJJ/0Md
         vhHTgtPiIhLkbTQmhpFp7Wv/7f6qbLPhIr5AtSNaBe9FqTg/0ALCMw20fkbqQ/CZ7eGE
         po/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        fh=wQc3N7xYSyNhQPZbcFM5f51vUX19aXZZnwUy3knCAmc=;
        b=F4Hoxv9+4NRoKHarOnluBPctrCXfk/aYkweivOhVmjSYFct//HRe2r3YFcu0YcU1/P
         Hoe8phAUrZHjPlI0G4H8ykFoR3+Q158mhMSfaZDR7LcxS6r52bfqes8BDMn71wBgpXqU
         J+t0j3dZSkD2EcgtVfrPC6cPyT1mKBRHEjSLTI+/MvaWvjy9DarYbOg9LYVjc+agi8ue
         oBzOm7yqajeEvgNorrlnUGqchmHdFx88qDmlXIYIQ3F30BIZ7RsbuFaRZmvlqglYRuSz
         Qu7bJ6reRoUBg8iBJAE2RvV5PkxL/2i17KAlUmx7C7OEcdROggP6Be2QfILxyUgQr/7C
         BLrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792642368; x=1793247168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=aBkdRjHKT0RWn7qpIwqxy4VM9HQRYKGWRLhJP4JK7+xEoNJ9kIZRhgDEVCix2tntZ5
         DHOcvwQkMHcnUoHpvRD0AS5WDQsuDF8UcRc7f83io9ageFsDlLkUu/UWl4G0bis4+oou
         u/co1MUqB3lIiW9dNH06UcJVMHh9A4xbT5WDbsqBg1xL1IlOCP8RysvYCjtR1MPG8Zys
         WwDdBbr9MUaQq3Oxp6L6AaeiVxKFBgi0O+qEEMrRtPxxCNedSV6Fax2QRcy7UIys9mMX
         zpkuZ5RANEXtl6ohMVtuYxq2/f4o1eby0U8HogljW80X+e6Mq/uHVcaWadKidgOD0ZyK
         5eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642368; x=1793247168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=b/lH974zvbCXRtjZrCrTXihqFyKzGnbz4E9LpwutKANydD4sgJkNHep/0hkAvYMoLR
         dbJe4B64Dx90BWbgevaa1fMlFZ40G7vWSwXQB+5L+Ap8djzKdtHgXnf8R5eCBUUl0L+i
         ymkInv5hOQhWziP4ZyGn9ie1Dh3bNR6BtxQDjYLfn+194VKUKrCU9Dt2HiUbSfvOhwck
         p/gZcraHLXhjbU65WyC3Oow50UGTvUwUxuonOIdEtLNdIQOzPiRUwXnatxxp/9CLNMOY
         F+t0dIUZ4JPEMhqgLyM/urbRgYdhr0hR9998lSBAhQRxsLIOk7uaW1jktI5S5LyXN3a7
         0uPw==
X-Forwarded-Encrypted: i=1; AKwUvBxeFzKLL/OADvNOFOJZxoM9DLIww7neEt1HQo2toUomQobFZ2igZVXn1k9KsRGFi/WAqU+JxHoxHjgXHg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKSqyDeJaAqaJTUsBWb8Sad3FGL63mqTCHoANOlqTjrqOL94xpY
	E6uEiPVn9Lnjclv/n+aYffhnEeomTBUSUubphdpugOnzcCKsc0PI6j1V/xljZUKf0aCiRUAja/T
	fAo/zOvbQ4nKNO70Szxw0qPgKzYVGS9E2cxYltynmk7S+zT1owW6ueB4AlP6JFjgSVNNHNJCWjh
	lXW38k7HbqcWwPesmCN11OLJ/rbdL3oXvRcW5dbVPt6rG+jA==
X-Gm-Gg: AYBFou1ME5Hawewn0Kkp3Ml4bXYXaSKJlzsp3GKYDazGBQYDUiEaC1ZQqY1VdmGku1h
	HIwGY3qzk/iJXc3+/NJVxNH25a/qdLefEMjrX9rTDBOWFIuNixqW7hKxKtcWpDH99MPe+XenZmM
	gQ8VcOZ0vIh81JsviIWl82t+bA6oefsA6ddZQdwpeLtMXL0h0Vkxfq5nxfxgI=
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id 956f58d0204a3-67a0e4bbf6emr1062097d50.35.1792642367622;
        Wed, 21 Oct 2026 21:12:47 -0700 (PDT)
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id
 956f58d0204a3-67a0e4bbf6emr1062061d50.35.1792642367081; Wed, 21 Oct 2026
 21:12:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com> <atPhE6rF0Uz93qF2@thelio>
In-Reply-To: <atPhE6rF0Uz93qF2@thelio>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:42:35 +0530
X-Gm-Features: AclHuK_KjNarSdeGtOiebAPfz9T-Tt_QOkpNIpxbMPcQ9dxWkRZQBbqOt91xNeM
Message-ID: <CAB19ukGGcDgbewvdMf-TBCYSpN3ksvbU_tJSJdRx0-EKb4Ze_A@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX/49f/VaD2QYL
 CfFELzGLuqeeCro6ZfxSewsu5gugao2uN/Ap3hw2c7WHrXLnw2/IeHHKLMBVKsuCJQHkvVWrYVb
 /flP/SYL0COiuHXLwL5GBIUae/NAhDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX5sPdb3m/abqX
 IMTH6zdUL5vxs5ewP55w3GZmjNihYbWlIZdtgvi+KeZ7hHWDDZ7Rj0hFLipvEGQBThls0s/uN6G
 38RysQrcEOLgNCdvGqp8uqVEhm8TtqNsonDgiWvLD7PxgFugYRd2KQy5SiWOYThC+AhdvN6Vtbn
 MJU6qgpzrtPUC6bBoqZxO1SfIhPBz0wyhINAsFphngwoUJl05bCSOhXSuNUjEg4cTjANKZ/uYRB
 R094tsouAlXog/hSgGqDAQgemnZK9tN3V8kfAwvQ9n8elx2hJ+WEk8T+zEe5G+tpMMGBp20CEKM
 VDSu/yEU5USIZH63xuYazY3HccboIwI+lpbBuCPmRGzN65UVy96iLClz0UHzM9HZmQmHD9QcPki
 WApr+c32YMclcqhoCjaXbxEwOqyw3MZ0ntO1mxPttu7MZlioQVpFZebfq5SfD1uHK6Nmf9zD5dv
 baV4gGcxH/BoOtDoO6w==
X-Proofpoint-ORIG-GUID: t7bBmjoDVBK0YfQ6loVUF79MrZHH7_IZ
X-Proofpoint-GUID: t7bBmjoDVBK0YfQ6loVUF79MrZHH7_IZ
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad98d40 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=IpJZQVW2AAAA:8
 a=jDNYHvWEAysQCaIWslsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_211250_868389_364B57CC 
X-CRM114-Status: GOOD (  31.75  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMjoyNuKAr0FNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDEyLCAyMDI2IGF0IDEwOjIzOjU3UE0g
KzA1MzAsIFN1bmlsIFYgTCB3cm90ZToKPiA+IE9uIFNhdCwgT2N0IDMsIDIwMjYgYXQgMTI6NDXi
gK9QTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFdpcmUgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlcnMgaW50byByZXNjdHJsIGFzIFJEVF9SRVNP
VVJDRV9MMiBhbmQKPiA+ID4gUkRUX1JFU09VUkNFX0wzIHNjaGVtYXRhLgo+ID4gPgo+ID4gPiBy
ZXNjdHJsIGV4cG9zZXMgYSBzaW5nbGUgY2FwYWNpdHkgbWFzayBwZXIgcmVzb3VyY2UsIHNvIHdo
ZW4gbW9yZSB0aGFuCj4gPiA+IG9uZSBjYXBhY2l0eSBjb250cm9sbGVyIGJhY2tzIGEgY2FjaGUg
bGV2ZWwgdGhleSBtdXN0IHJlcG9ydCB0aGUgc2FtZQo+ID4gPiBudW1iZXIgb2YgY2FwYWNpdHkg
YmxvY2tzLiBUaGUgc2FtZSBob2xkcyBmb3IgdGhlIG90aGVyIGNhcGFiaWxpdGllcwo+ID4gPiBy
ZXNjdHJsIGV4cG9zZXMgb25jZSBwZXIgcmVzb3VyY2UuIEEgbGV2ZWwgd2hvc2UgY29udHJvbGxl
cnMgZGlzYWdyZWUKPiA+ID4gaXMgbGVmdCB1bmV4cG9zZWQuIE90aGVyIGxldmVscyBhcmUgdW5h
ZmZlY3RlZC4KPiA+ID4KPiA+ID4gVGhlIHNldCBvZiBjb250cm9sbGVycyBiYWNraW5nIGVhY2gg
bGV2ZWwgaXMgZml4ZWQgd2hlbiByZXNjdHJsIGlzIHNldAo+ID4gPiB1cCBhdCBsYXRlX2luaXRj
YWxsLiBDb250cm9sIGRvbWFpbnMgYXJlIGNyZWF0ZWQgaW4gdGhlIGNwdWhwIG9ubGluZQo+ID4g
PiBjYWxsYmFjayBhbmQga2V5ZWQgb24gdGhlIG9ubGluaW5nIENQVSdzIGNhY2hlIGlkIGZyb20g
Y2FjaGVpbmZvLCBzbyBhCj4gPiA+IENQVSB0aGF0IGlzIG9mZmxpbmUgYXQgcHJvYmUgdGltZSBz
dGlsbCBqb2lucyBpdHMgZG9tYWluIG9uY2UgaXQgY29tZXMKPiA+ID4gb25saW5lLCBwcm92aWRl
ZCBhIGNvbnRyb2xsZXIgZm9yIGl0cyBjYWNoZSBpcyBpbiB0aGF0IHNldC4gQSBDUFUgd2hvc2UK
PiA+ID4gY2FjaGUgaGFzIG5vIGNvbnRyb2xsZXIgaXMgbGVmdCBvdXQgb2YgdGhhdCBsZXZlbCBh
bmQgYSB3YXJuaW5nIGlzCj4gPiA+IGxvZ2dlZCBvbmNlLiBBIGRvbWFpbiBpcyBwdWJsaXNoZWQg
b24gdGhlIGN0cmxfZG9tYWlucyBSQ1UgbGlzdCBvbmx5Cj4gPiA+IGFmdGVyIGl0IGlzIGZ1bGx5
IGluaXRpYWxpemVkIGFuZCBicm91Z2h0IG9ubGluZSwgYW5kIHJlbW92ZWQgZnJvbSB0aGUKPiA+
ID4gbGlzdCBiZWZvcmUgaXQgaXMgdGFrZW4gb2ZmbGluZSwgZm9sbG93aW5nIHRoZSBkb2N1bWVu
dGVkIHNhZmUKPiA+ID4gdHJhdmVyc2FsIHJ1bGVzLgo+ID4gPgo+ID4gPiBBc3Npc3RlZC1ieTog
TExNCj4gPiA+IFRlc3RlZC1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
PiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJheWxp
YnJlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJk
aUBiYXlsaWJyZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICsKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcmVzY3RybC5oIHwg
MTQ3ICsrKysrKysKPiA+ID4gIGRyaXZlcnMvcmVzY3RybC9LY29uZmlnICAgICAgICAgIHwgICA0
ICsKPiA+ID4gIGRyaXZlcnMvcmVzY3RybC9NYWtlZmlsZSAgICAgICAgIHwgICAxICsKPiA+ID4g
IGRyaXZlcnMvcmVzY3RybC9jYnFyaV9yZXNjdHJsLmMgIHwgODMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA5ODUgaW5zZXJ0
aW9ucygrKQo+IFsuLl0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9y
ZXNjdHJsLmMgYi9kcml2ZXJzL3Jlc2N0cmwvY2JxcmlfcmVzY3RybC5jCj4gPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjEwYTI0NzYxYjI1Cj4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvZHJpdmVycy9yZXNjdHJsL2NicXJpX3Jlc2N0cmwu
Ywo+IFsuLl0KPiA+ID4gK3N0YXRpYyBpbnQgY2JxcmlfcmVzY3RybF9zZXR1cCh2b2lkKQo+ID4g
PiArewo+ID4gPiArICAgICAgIGludCByaWQ7Cj4gPiA+ICsgICAgICAgaW50IGVycjsKPiA+ID4g
Kwo+ID4gPiArICAgICAgIGZvciAocmlkID0gMDsgcmlkIDwgUkRUX05VTV9SRVNPVVJDRVM7IHJp
ZCsrKQo+ID4gPiArICAgICAgICAgICAgICAgY2JxcmlfcmVzY3RybF9yZXNvdXJjZXNbcmlkXS5y
ZXNjdHJsX3Jlcy5yaWQgPSByaWQ7Cj4gPiA+ICsKPiA+IFdoeSBjYW4ndCBjYnFyaV9yZXNjdHJs
X2NvbnRyb2xfaW5pdCBkaXJlY3RseSB1c2UKPiA+IGNicXJpX3Jlc2N0cmxfcmVzb3VyY2VzPyBJ
IGZlZWwgdGhpcyBpbml0aWFsaXphdGlvbiBpcyByZWR1bmRhbnQuCj4KPiBUaGlzIGlzIHNpbWls
YXIgdG8gd2hhdCB4ODYgYW5kIGFybSBtcGFtIGFsc28gZG8gc2luY2UgaXQgaXMgaW1wb3J0YW50
Cj4gYmVmb3JlIGFueSByZXNjdHJsIGNvZGUgaXMgY2FsbGVkLiBmb3JfZWFjaF9yZHRfcmVzb3Vy
Y2UoKSB3aWxsIGdldAo+IHN0dWNrIGluIGEgbG9vcCBpZiB0aGUgcmlkIHZhbHVlcyBhcmUgbm90
IGluaXRpYWxpemVkLiBJbiBjb250cmFzdCwKPiBjYnFyaV9yZXNjdHJsX2NvbnRyb2xfaW5pdCgp
IG9ubHkgaGFuZGxlcyB0aGUgcmVzb3VyY2VzIGZvciB3aGljaAo+IGNicXJpX3Jlc2N0cmxfcGlj
a19jYWNoZXMoKSBmb3VuZCBhIGNvbnRyb2xsZXIuCj4KPiBUaGUgaW5pdGlhbGl6YXRpb24gY291
bGQgYmUgbW92ZWQgaW50byBjYnFyaV9yZXNjdHJsX2NvbnRyb2xfaW5pdCgpCj4gYmVmb3JlIGFu
eSBlYXJseSByZXR1cm4gcGF0aHMgYnV0IGl0IGRvZXMgaW50cm9kdWNlIHRoZSBwb3NzaWJpbGl0
eSB0aGF0Cj4gcmlkIGluaXRpYWxpemF0aW9uIGNvdWxkIGJlIG1pc3NlZCBpZiBjYnFyaV9yZXNj
dHJsX2NvbnRyb2xfaW5pdCgpIGlzCj4gZXZlciByZWZhY3RvcmVkLiBHaXZlbiB0aGF0LCBJJ20g
aW5jbGluZWQgdG8ga2VlcCB0aGUgY3VycmVudCBzdHJ1Y3R1cmUuCj4KU3VyZS4gVGhhbmtzIGZv
ciB0aGUgZXhwbGFuYXRpb24uCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
