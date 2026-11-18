Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62358606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHleFk6E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ld49XmAX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdFW6sB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kA7Hgdh7ekz2TrPmmdEdJAdzXV2wrWM4R5ID8svL1sI=; b=vHleFk6Er7DX8xkCU9meGjEtVX
	MHE+tppSC/C8tWvIH6rFYqfEH0q8My/G1boaFaXaKzYXmK9jxAITkKYjWS+/UAntcJr359HUywlft
	MW/IFkWDi5UrISnhMWO1UuykNXHf35Lcz3+rxqmKsGAtuKBFgrz6MTADTjD0PvITyRRN4Z6dzh9yt
	iJtLKa27eXQ1Xfoo6jV8NK/BGlV6tnPgPr5LhiPbhMdi/ZaIS/jXBjarv68YvdosrwVVO/3b2ZZLV
	4FoIx9Ca427z48c6M1ERIFmcdIB1H2KGiGbxkiVt6JdrP0lCZ6QIRYSjKjHSa0YXnRJbpDhck+A26
	KuY+deNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ03-00000007qvI-4BLe;
	Wed, 18 Nov 2026 06:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ01-00000007quq-1XLh
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 06:18:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V61P2603443
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 06:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=; b=Ld49XmAXACB/M0kr
	Tmg+9yxrxPm5oOu6CqBJ3JTobvNDRzgnoTSocu4Aq/nlVcwyl7OFqBmjC0qYfPZZ
	XmvQxnvnjT8p0e7jElVqfNOw5A0TPRe0DPAtc4VmLtKgLXiehaedq7lqRoWPBnXu
	PPizLVeF/DrPvFYjZUE87th30BuDOprmG0bHiw8WYAnFqdz/nIVo7rRkdb5tg1v0
	2KpCJ8geLzc8AOSFnlQq2XW3y6u9srjFCXCjAahu0i/PiaaW8hiOx5wjBMNO1bjC
	YY4dLgXbd5g8t7AUoamfdYTfa4B7FORq+mlAMSrR4i4P+o/wFoBNNsZh7KYTMLHE
	5z4KJA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71hd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 06:18:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so5925995ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 22:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794982705; cv=none;
        d=google.com; s=arc-20260327;
        b=qPKJQT0Nj74rUn+hed0H3Iov6aCf/QQzTmk5y5TEjMw0IyluqaaBaa2lt54uEVBj/h
         AaJf8RLYQAztkPHSBThJBfQvdfscwAKVhEH09IN716mjBaDKzWQ/xGUh0C9FEre0+8an
         FYkBoIeTzqiJw3RIt6Z34HowJnq5wxvHAwA7Oa+bQYXySxzxaJNgELOYTUIuvyuzmVAi
         USR1GCDfGja3EeUM+3NzMopeqDyglKkucvmf7a0MfsgHclaGWCq40L7lGvw8bUb/d21b
         GIRrtxpoGROhyOKEKGGrj8KVBU3CHiRh3tHAY/IvFm8PbVYJZZMq3PnJF0djOUQ56j28
         aM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        fh=R20dF3BLd+SJ8bZzed499Ytt7YG6Wz8T4WXFm/OseLk=;
        b=Aeige3KHCI+jfh8FkMS148PPdEJx9lYHtUk6UzFQezgn59V7UJ6ckYArGGAzkYRzjY
         +FCTXOGUDWe5DWwVbCjKqf3D6gr+Eiyb8hynfQV7WlA+3qXoJOf9RusTEX+u6+qPqJwh
         Q4p2LoJLV9tTIO7Pa9o26wj0LT0/4g4VUoRZa7Wd8d9W1ZsBtXljAJlfWh3FZ0+ngUyZ
         SfLyY/HEq/mASJBQWAEvyGq+orqwPwxynMA80GnTbHEB9BulGdnzM5C4RgeV02TLRx2c
         WWEdkR4rDbDsplMv9sQBe+ozLisKhPcKJe7asjlHlPl06QJaHDNLJ24L5+SWUgiIYpiE
         i3bA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982705; x=1795587505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=QdFW6sB+RGUlTnT2pHdTVySLo0lLAFgCfBaeO/+7+8Z0xPTIMbMyL+hwOWhC9OzKFE
         qHK2BzGU/GJC4ZhsZc09B725I8JuGTl8xhsNAfSpBh3mBfRq2RCMvjK+Lfj5lg88Oi0D
         Cxbi3l8At/8KsIRclNzZ+HkZhEPJ6nCtMFnYNXx/40Mx9ZfYy1hRE+VVtCHtlhJxf/12
         UIKBFA1j2l6Dx0HQvnaK3kHpXl4/C0HFbNCUFt5FRbTiKe89ti5shyFWolxbRp5wugf8
         31k5z9itq/L5cPHOhbdIyO/NcvdB/zoljWgtcJPUp738mtYzCx7o8hGszdCqEaidsI/V
         2jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982705; x=1795587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=v89FiPnU49PgvqNap8dhtg7g3Bh8kax8TyJL6kqXboY8JMrWs8DUcdOCSNcAI22+BX
         oELN2Gin7ScNZy3BILySkImKA4FcMpbH5jZpF+DgYv56YGbgK4H26RMx8RNIJqe0K9dN
         qgqizMqkAp6BSxiztcYhdfrpeyscS137IBN76XDSiWsjMAOfCSPNzcfUfAGvDyPLeo09
         3W3hH8A9RC4HeSEvsmh36rpn5Z8EnAL0n49WW11gQ22Pa10y0nEuM7pLQn44qBKB8PnX
         /UPQ86zxIphJOczUpJyljMegKl+tj9OIXg0NiTCnzsbJB5WtqrHCU6fbiuxiS5WULwKu
         9BjQ==
X-Forwarded-Encrypted: i=1; AL+hErFcgWzw4ilEDXrG6RvoBxI9ppQXpHVCiB2Gm/MPPcZoTc1J3vnq0xgmWabe65t+GUvmTFWim1rAL/WdOA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+vb7htyQnCToa7YZql57q2UUFL1pBnBA9vTgN8gdHunnZUpzUX
	iaYAwg7x/H9b/je+nYqHMkkj0GKpQ64drC3vU1DI0cqm44ekjpq1LXVUVs573dLjiHFH83HpMzp
	+N9aCkoTxhopKKYRLsOBf5TCkfaOOReJ0n9LjbfuAuRJr9fzPKrb57gcM24c7rikjSlVJxx39aJ
	ldrvaKra1FmRrKiSixTiHuBefwMX/K9ssYO5uzTtkVCw4NDQ==
X-Gm-Gg: AZFdTZf4TmwfAhNNBaJwL1tikGTzLvW79Dkqs3saYa+vI2R+h4PBTeAzrDa8w19dYD9
	eQk5tnSwk+7k/IiWGFhIjObGgmTfqRsZyBtKyj3ST79JIQY4qdILsCYaQWXmljaj+K+uS0B/XUH
	7I8ZkCq+mloZ1pQ099MTsMGeLmrihGMmDw2YX0cDfp7Z2+BDabJmRK0U0Yz6Q=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr17637025ad.57.1794982705335;
        Tue, 17 Nov 2026 22:18:25 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id
 d9443c01a7336-2eff754e4d0mr17636585ad.57.1794982704875; Tue, 17 Nov 2026
 22:18:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com> <auAubdjHl1V4h16N@lliang-1876.localdomain>
In-Reply-To: <auAubdjHl1V4h16N@lliang-1876.localdomain>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:48:14 +0530
X-Gm-Features: AclHuK93Leu4hHdh8zwa7f5_jOXasRQchKpCNV9Lz9duf1vReWB65vNkuZ7HV-8
Message-ID: <CAHuiULAq_ADvcbmiyZ5cxjeeuD-5=6-GL6uDdwCYC2GDnEq0QQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Leo Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
X-Proofpoint-GUID: zxtSh8Aa38YTwolq7TaBo7aL2aEEs_6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxkqgm2GOdCN6
 sSuhJNslUkkY+TiTYxnOOrW99KZa0hQYBuUd9gU4QPqHLQhNrwL65uE181PmMLKus/oV3r7Cct0
 OEZojjkGO3+k4NU/bfACWdXiD8Vbz8ve0su07R4U/J+MIr/rclCxM1FlJ373Hy2umAvdXO/K3EZ
 61A6hJlJiRR+jFPF47lHk5tZnyVFq3KLUX+LWi4FJ3qG9b2dy0fY5lpHgxnkmglwCFvEP5Lr0Mn
 OyidsT/wospLOdZ2iuFdB5fqPZm5Ulwcnpl6TbXvWKrSv9W8e5vpC2GfDM9CcLdsMDmGAk+yJGY
 g2YHgom86H3FOSjx+IQu+kneoo58H1Ra48yyI3RgZeggn0NNq1tguCQvqwwVud9PWdLvv3xeH3P
 qeh8asbjLzhiqsQAQTFGrWiENF/4O+T+YCpIlhuhuBftr5ynYEfqkxZtY4Xyit3QsZPMLpITHMM
 jOvWA5kvaP3m02ea9ig==
X-Proofpoint-ORIG-GUID: zxtSh8Aa38YTwolq7TaBo7aL2aEEs_6R
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4332 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=0ihfoYnQ4k24nRVI1fYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX060xlBahp2Xd
 BOzZCIwybav+b8xPbI6gSyKKHxJXp0GqUsQJ4+kqWAp343+5O/rmOmoWEnOGO2U8PAR2UVxO+NZ
 sAHEad5g679XXq/cdl9LZvmqqJZkAjs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221830_042062_F5C78834 
X-CRM114-Status: GOOD (  24.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTA6MjTigK9BTSBMZW8gTGlhbmcgPGxlby5saWFuZ0Bz
aWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDAxLCAyMDI2IGF0IDEwOjUyOjE0QU0g
KzA1MzAsIE1heXVyZXNoIENoaXRhbGUgd3JvdGU6Cj4gPiBGcm9tOiBBbnVwIFBhdGVsIDxhbnVw
LnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gPgo+ID4gVGhlIFJJU0MtViB0cmFjZSBjb21wb25l
bnRzIGRlZmluZWQgYnkgdGhlIFJJU0MtViBUcmFjZSBDb250cm9sIEludGVyZmFjZQo+ID4gU3Bl
Y2lmaWNhdGlvbiBhcmUgbWVtb3J5IG1hcHBlZCBkZXZpY2VzIHdoaWNoIGFyZSBvcmdhbml6ZWQg
aW4gYQo+ID4gZ3JhcGgtbGlrZSB0b3BvbG9neSBhbmQgZGVzY3JpYmVkIGluIHRoZSBkZXZpY2Ug
dHJlZS4KPiA+Cj4gPiBBZGQgdGhlIFJJU0MtViBwbGF0Zm9ybSBkcml2ZXIgZm9yIHRoZSBndHJh
Y2UgZnJhbWV3b3JrLiBUaGUgZHJpdmVyCj4gPiBwYXJzZXMgdGhlIFJJU0MtViBjb21wb25lbnQg
dG9wb2xvZ3kgZnJvbSB0aGUgZGV2aWNlIHRyZWUsIGRpc2NvdmVycyB0aGUKPiA+IHR5cGUgYW5k
IHZlcnNpb24gb2YgZWFjaCBjb21wb25lbnQgZnJvbSBpdHMgSU1QTCByZWdpc3RlciwgcHJvdmlk
ZXMgdGhlCj4gPiBSSVNDLVYgcmVnaXN0ZXIgbGV2ZWwgY29udHJvbCBvcHMgYW5kIHJlZ2lzdGVy
cyBlYWNoIGNvbXBvbmVudCB3aXRoIHRoZQo+ID4gZ3RyYWNlIGNvcmUuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4gQ28t
ZGV2ZWxvcGVkLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFs
Y29tbS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtYXl1cmVzaC5j
aGl0YWxlQG9zcy5xdWFsY29tbS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2h3dHJhY2luZy9n
dHJhY2UvS2NvbmZpZyAgICAgICAgICAgIHwgIDE1ICsrCj4gPiAgZHJpdmVycy9od3RyYWNpbmcv
Z3RyYWNlL01ha2VmaWxlICAgICAgICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy9od3RyYWNpbmcv
Z3RyYWNlL2d0cmFjZS1vZi5jICAgICAgICB8IDEyNiArKysrKysrKysrKysrCj4gPiAgZHJpdmVy
cy9od3RyYWNpbmcvZ3RyYWNlL3J2dHJhY2UtcGxhdGZvcm0uYyB8IDE4NiArKysrKysrKysrKysr
KysrKysrKwo+ID4gIGRyaXZlcnMvaHd0cmFjaW5nL2d0cmFjZS9ydnRyYWNlLmggICAgICAgICAg
fCAxMjEgKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgvZ3RyYWNlLmggICAgICAgICAg
ICAgICAgICAgICAgfCAgIDMgKwo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNDU0IGluc2VydGlvbnMo
KykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od3RyYWNpbmcvZ3RyYWNlL2d0cmFj
ZS1vZi5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHd0cmFjaW5nL2d0cmFjZS9y
dnRyYWNlLXBsYXRmb3JtLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od3RyYWNp
bmcvZ3RyYWNlL3J2dHJhY2UuaAo+ID4KPiA+Cj4gPiAuLi4KPiA+Cj4gPiArCj4gPiArLyoKPiA+
ICsgKiBQYXJzZSB0aGUgIm91dC1wb3J0cyIgZ3JhcGggb2YgdGhlIGNvbXBvbmVudCdzIGRldmlj
ZSB0cmVlIG5vZGUgYW5kIGFsbG9jYXRlCj4KPiB0eXBvOiAiaW4tcG9ydHMiCk9rLiBJIHdpbGwg
Zml4IGluIHY3Lgo+Cj4gPiArICogcGRhdGEtPmluY29ubnMuCj4gPiArICoKPiA+ICsgKiBSZXR1
cm46IDAgb24gc3VjY2VzcyBvciB3aGVuIHRoZXJlIGFyZSBubyBpbnB1dCBwb3J0cywgLUVOT01F
TSBvdGhlcndpc2UuCj4gPiArICovCj4gPiAraW50IGd0cmFjZV9vZl9wYXJzZV9pbmNvbm5zKHN0
cnVjdCBndHJhY2VfcGxhdGZvcm1fZGF0YSAqcGRhdGEpCj4gPiArewo+ID4gKyAgICAgc3RydWN0
IGRldmljZV9ub2RlICpwYXJlbnQ7Cj4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ICsKPiA+ICsg
ICAgIHBhcmVudCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGRldl9vZl9ub2RlKHBkYXRhLT5kZXYp
LCAiaW4tcG9ydHMiKTsKPiA+ICsgICAgIGlmICghcGFyZW50KQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHBkYXRhLT5ucl9pbmNvbm5zID0gb2ZfZ3JhcGhfZ2V0
X2VuZHBvaW50X2NvdW50KHBhcmVudCk7Cj4gPiArICAgICBwZGF0YS0+aW5jb25ucyA9IGRldm1f
a2NhbGxvYyhwZGF0YS0+ZGV2LCBwZGF0YS0+bnJfaW5jb25ucywKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZigqcGRhdGEtPmluY29ubnMpLCBHRlBfS0VSTkVM
KTsKPiA+ICsgICAgIGlmICghcGRhdGEtPmluY29ubnMpCj4gPiArICAgICAgICAgICAgIHJldCA9
IC1FTk9NRU07Cj4gPiArCj4gPiArICAgICBvZl9ub2RlX3B1dChwYXJlbnQpOwo+ID4gKyAgICAg
cmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoZ3RyYWNlX29mX3BhcnNl
X2luY29ubnMpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
