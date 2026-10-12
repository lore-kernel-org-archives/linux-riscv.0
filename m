Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C644FCA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdFF12oL5d7phme3SpTM0iQJsQeXNziAniUjVZ/oQW8=; b=mm1GR2RBnvqL6J
	MPVJOR8JUofoQcwMhvsgbtAwvdA5rWnVi4SjykER0hy8/+yyGxcHmq8ROcAGFSlLFOppCVSaMG/eB
	hJ7FxES5zBiv5NGcM2eOlG1UzjLljh1cA9M9NOSsMOuykWhyfry3nfmr2XPjX97GAZDUV8SwMnLdb
	2ARSyXtfrkWrzbdpZ62cDEBXhasF0FTfAqedB2gwzSPJRkXBUfKGscr6jEiRPg+zk03/0D+JTv2RF
	HsGJrPPfqHm/RZlwxNbTfYgLL7WIfnrnU3qvoOgw8BsHaHziiR9AoImYWQFQGRaLQtf3puySGPict
	W8qJOStz5fMNmLIOQpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJR5-0000000B3Jt-0Ee7;
	Mon, 12 Oct 2026 17:03:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJR2-0000000B3JJ-0UBG
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 17:03:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFelxV3782552
	for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 17:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=; b=gA
	uM4byRfyRQ6OxvKWIKp3THc23mdB+NTJVIPbnaN3IWktVLDG2tOT4JlHZ8KjcYah
	7G4bdveVl5QKTGFNGjRQUj5oj984gNtTi+tZ4RTnkm40BIf37Z/fK/JGvzureTBs
	1/TvXAFTaKhRc/3RTa58+rcIKq99HJH7aaxcuSJI+cpKbNhHGI418Rac0AniAqMk
	61GRMt4HsWgu2pDkvswTk4tmZn9UVLPLeeYYap7ABZSDOH+aE887WGUELNXtZJOj
	sCL/zgQ2ZK1h4E+RSwb9uWYU7znbrq3xXKpyeLwUQHuhjvS1TsSIaq5oNqZ41s+r
	JCok3Y1ujz6ftBYZISdw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3jgcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 17:03:35 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8acc7fe346cso30388507b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 10:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824614; cv=none;
        d=google.com; s=arc-20260327;
        b=J/VjJyQRdtQI/iMXmocyXL5XS96E7Ktff/E4BOsNhNb7LOqHO+kzUkRq6OB7pKfBya
         5+pPOZYGlSPhRZFM/WUhbvdZ4m4f9/mA2AhmqtCvK2rQNYMAq9nuxKa8GrXcW2ZBTIt4
         PftzGbTBDH9pxIwOb7GeL1oEsaXhiaJHRfXv5tJgVMFVfjYsrx3JWG8ypEFS7oc7hIaw
         x9T3i+tM7kSixinZEeEsEbUOkEtrI+MNX3/uHvU4n6OVQcNV8hJtVOyMfhcyM4VR1y3g
         fkjnlMv5rYPXfAqY7F04pl4ckOO8jXhV5jwBZGXNM8TXQNo8E7vPx/s6JYsN1auHbkJU
         EMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        fh=PJ7b0u7NnS53vPLDR/cZ0GRPuQPlvYbFQNXBS4PGlGA=;
        b=joRnhXCqzCcbYV/aY2W66/vz5Lwjn46ZfANDGRQXLLP/g8iNC8/S0ynpDwx58fxgKt
         6UB/evQySCuKPdVYS0yua+lxOgu8InSd+IRODYE6LHnP0FwdpD+PoehzHZiaH0hPTEpL
         LAW6TJrV98lzjEwn/d7EzD6TCDcAEa2rQ/cDt/OB8FEmJxfAjpZqFmHVs2DMBBUlDglz
         Rdqnvr27Yi/+Jcmytl7PnZPWJLEyqCvKQQxd0yOKFLWZSYCg0H6Kdy6eYnBDr1+5t9HF
         pn72hJuY5pB+gWXXTpqEbSiBYN6CPORB1wLLgXNk+sdw5oAk0SDaEkLsf3YxUE54reha
         C2Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824614; x=1792429414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        b=GwNIh5+5B+gx7pQ1rzmTB+thKSG7JkkeSWMVYgsKKtkLha+TmwjORAfWOBdvSOeLSu
         ieEnVFjzyLrpdOl/70qtGVSiA2kB7dH4HP2Nv4R7sOBeVhIVqsG55oF4jB1BlPLgaqS6
         rB0BoKwZb6FppLci929d6mHskULNreBXIDPD2j2Vy8qqHn6menGahAquvl1QmPGL6eyA
         figP0uckpln8o8UiYBWolSrOMeJIMWeQ1chYQK+OpqrZ7cz/AX6Rp7R2zXOePX9QJwpV
         db2WF0/BPS5wQIfOOLnFrG/21CQX8KWnJIDE3OtuFPiSHpWZb24Z/jC5NW/1m0Z5LInk
         PKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824614; x=1792429414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        b=kNFSUsxQ2V51zYBmUY6b21yopuIxNERagMyClcKXXKvo6d6zx1ULWvUhBngSoDEC6+
         P+UiYZQIoApU2t18/JSt3wYIcAc1sOC9JlQjZgeaHfaBDYn3gyWTjZgrX6dPO0ddErMl
         dld+yyKFujnbsCje5X/r1Ch1dyhOptBeiaAQUGh8klmRuxQegydOzmtH/kN5DSi5NLr4
         8lU8OV/AJR+SzMnnDM/HtuaIbCU+hYfypAKS5t+03mDZ7012vbRYdsMLdpjgo5fR0nkL
         DYZrsKiTytrBoBmUQ9HW8WvUMwW9OIQteRUW4oPF/n+Mfn8IB/99gXeIHHv+GRNCRrAX
         QJYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpMoqkIpMgoPEnIEoaqUFRV0tZhqlVsdErSQ6rCaAY2n7x6Prbd6erQ6O8ZxstRZWI8KJd3bibNCZ9VQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLa9UzSIAo1Wm9LCAKzZ9NfR5LMogXLu1PtEXwg91+ibLJtz9Iw
	8NqbFKRzzSlST8fc4cB5BMuXk4cBZ90zWEDXaytpxXEY0RiJjaX+CeZY5+rr7+782I2greZqJ7l
	XImJ5kup8Dvcr6Rs9Q/sgONy7bTqDKZozgRkcjdqEQmX/9Cwa0lGTDIv1Webfgq8h3HuE0JAYq+
	6rXJlzkhG+nevd8VpQlhoh2L2UrCgcHCLp7wQCLHqfwDwNCQ==
X-Gm-Gg: AYBFou1Uq0eCQvpinGGSbkF9IFX00VLUP2hcUeWq66yzHZpHCjgpx45VtYZVB4W5i78
	ipNHmQ9lhBan8CzxIAJUXEIDGbZsHeCZgS9tiLvYkGdkCkuwTa7Wpbs7tZR3saax1aWBYzkKxT+
	d9FFdxh6fDY3HD2WmHowuXCeGlTsck0ZtsnsA4oRCM3StAAJ6U4VqOoO03zc8=
X-Received: by 2002:a05:690c:e3c4:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b0aba3ab6dmr8912577b3.37.1791824614064;
        Mon, 12 Oct 2026 10:03:34 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c4:b0:8b0:aba3:a3e2 with SMTP id
 00721157ae682-8b0aba3ab6dmr8911907b3.37.1791824612923; Mon, 12 Oct 2026
 10:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org> <20261003-dfustini-atl-sc-cbqri-dt-v9-5-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-5-52fd8be98dcf@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:33:21 +0530
X-Gm-Features: AclHuK_eAnoXLHNe9JW1H0XsgI027UTvmUTL3dvXmeTZJjwIqBd2LIFlaZxAhKg
Message-ID: <CAB19ukEMKp7iFHrTPawNj2dwf1n0D9VDBC2ycBPdCRbkGYN2eg@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX7qxbzlDJGjSf
 yU37hn5JiFHTG/fcGf4dawYLdvmNNhg4w3k9c+NCTREbLiUpvtUs0mbxNXnDvu8ZGhv6SSaMOYa
 RoEmOaGce1IgyaSValQ+4dzS+iUR547nUGCjc9HTyBbAbV0xWxiD8LmyVt9LTmPX0tglwoE45Tv
 DZrppvt77tpStcuMXNYvJCg9qbgSiuAbFz01L4P67alOxqBYm/+SLTO/n6Q8XvhpTTl+SxbVJnq
 fkUejvunZS5EbI9/wsX6pAPcKh1ZOj6iE2QXQWAlbf84qofuF6Z/oTEEY+6nU6TzpkOd1VqVTBU
 oF1p/WGIHgxn0BtUVWAk+w8TBlcodDMB3y5+4kkbbU3PMoLatWzhWxj+XpA4NbxNRWU1JK7oApX
 D08t8vyGrzH9El14uF+gq2pUkGRw+Lmu/hFDoDnW/zEsDWoyng6ZRHHryYN10NdAzn7IQEVD91U
 HLdNJh4LQsqhsYSMyug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX3TWl3IiFhMPB
 V7TADbBYspejl/8US0WCA31wq57Qp1zeS5fcqG031HXyFvDA524zv81HBuzQJ5puQf7Pm+0zv9k
 TKV+N4QPIFmAaQ+B7EHRI3A9u0dT+7Q=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd12e7 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8
 a=u8ca8oee0k6j8m9lC0cA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: uxpNuDao6csp5ziLm3Fqk2mPraRV1YkR
X-Proofpoint-GUID: uxpNuDao6csp5ziLm3Fqk2mPraRV1YkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_100336_168937_202E186E 
X-CRM114-Status: GOOD (  34.31  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBPY3QgMywgMjAyNiBhdCAxMjo0NeKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFkZCBhIHBsYXRmb3JtIGRyaXZlciBmb3IgQ0JRUkkgY2Fw
YWNpdHkgY29udHJvbGxlcnMgZGVzY3JpYmVkIGluCj4gZGV2aWNlIHRyZWUgd2l0aCB0aGUgcmlz
Y3YsY2JxcmktY2FwYWNpdHktY29udHJvbGxlciBjb21wYXRpYmxlLgo+Cj4gVGhlIGNvbnRyb2xs
ZXIgbm9kZSBwb2ludHMgYXQgdGhlIGNhY2hlIGl0IGdvdmVybnMgd2l0aCBhCj4gcmlzY3YsY2Jx
cmktY2FjaGUgcGhhbmRsZS4gVGhlIGRyaXZlciBsb29rcyB0aGF0IGNhY2hlIHVwIGluIGNhY2hl
aW5mbwo+IGFuZCB1c2VzIGl0cyBjYWNoZSBpZCBhcyB0aGUgcmVzY3RybCBkb21haW4gaWQsIHNv
IHRoZSBiaW5kaW5nIGRvZXMgbm90Cj4gbmVlZCB0byBjYXJyeSBhIENQVSBtYXNrLiBUaGUgY29u
dHJvbGxlciBpcyB0aGVuIGhhbmRlZCB0byB0aGUgQ0JRUkkKPiBjb3JlLCB3aGljaCBwcm9iZXMg
aXRzIGNhcGFiaWxpdGllcyBhbmQgZGVjaWRlcyB3aGV0aGVyIHRvIGV4cG9zZSBpdAo+IHRocm91
Z2ggcmVzY3RybC4KPgo+IE5vdGhpbmcgaXMgdmVuZG9yLXNwZWNpZmljIGFuZCByZWcgaXMgdGhl
IENCUVJJIHJlZ2lzdGVyIGJsb2NrIGl0c2VsZiwKPiBzbyBhbnkgU29DIHRoYXQgZGVzY3JpYmVz
IGEgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlciBpbiBkZXZpY2UgdHJlZSBjYW4KPiB1c2UgdGhl
IGRyaXZlciB1bmNoYW5nZWQuCj4KPiBBc3Npc3RlZC1ieTogTExNCj4gVGVzdGVkLWJ5OiBDaGVu
IFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVz
dGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcmVzY3RybC9LY29uZmlnICAgICAgICAgIHwg
IDE1ICsrKysrCj4gIGRyaXZlcnMvcmVzY3RybC9NYWtlZmlsZSAgICAgICAgIHwgICAxICsKPiAg
ZHJpdmVycy9yZXNjdHJsL2NicXJpX2NhcGFjaXR5LmMgfCAxMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggYzM2
MmQ1M2VkMzU1Li4wMGI5Mjg0MmVmMTIgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysg
Yi9NQUlOVEFJTkVSUwo+IEBAIC0yMzU3Myw2ICsyMzU3Myw3IEBAIEY6ICAgICAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Jpc2N2LGNicXJpLnlhbWwKPiAgRjogICAg
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcW9zLmgKPiAgRjogICAgIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcmVzY3RybC5oCj4gIEY6ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MuYwo+ICtGOiAg
ICAgZHJpdmVycy9yZXNjdHJsL2NicXJpX2NhcGFjaXR5LmMKPiAgRjogICAgIGRyaXZlcnMvcmVz
Y3RybC9jYnFyaV9kZXZpY2VzLmMKPiAgRjogICAgIGRyaXZlcnMvcmVzY3RybC9jYnFyaV9pbnRl
cm5hbC5oCj4gIEY6ICAgICBkcml2ZXJzL3Jlc2N0cmwvY2JxcmlfcmVzY3RybC5jCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVzY3RybC9LY29uZmlnIGIvZHJpdmVycy9yZXNjdHJsL0tjb25maWcK
PiBpbmRleCA2MTdiODEzYjk4MDguLjY4OWE5MTg3M2Q3YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3Jlc2N0cmwvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvcmVzY3RybC9LY29uZmlnCj4gQEAgLTQx
LDYgKzQxLDIxIEBAIG1lbnVjb25maWcgUklTQ1ZfQ0JRUkkKPiAgICAgICAgICAgYWxsb2NhdGlv
biB0aHJvdWdoIHRoZSByZXNjdHJsIGZpbGVzeXN0ZW0gYXQgL3N5cy9mcy9yZXNjdHJsIHdoZW4K
PiAgICAgICAgICAgUkVTQ1RSTF9GUyBpcyBhbHNvIGVuYWJsZWQuCj4KPiAraWYgUklTQ1ZfQ0JR
UkkKPiArCj4gK2NvbmZpZyBSSVNDVl9DQlFSSV9DQVBBQ0lUWQo+ICsgICAgICAgYm9vbCAiUklT
Qy1WIENCUVJJIGNhY2hlIGNhcGFjaXR5LWFsbG9jYXRpb24gY29udHJvbGxlciIKPiArICAgICAg
IGRlcGVuZHMgb24gT0YKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgRW5hYmxlIGRyaXZlciBm
b3IgYSBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlciB0aGF0Cj4gKyAgICAgICAgIGdv
dmVybnMgYSBDUFUgY2FjaGUsIG1hdGNoaW5nIHRoZSAicmlzY3YsY2JxcmktY2FwYWNpdHktY29u
dHJvbGxlciIKPiArICAgICAgICAgY29tcGF0aWJsZS4gVGhlIGNvbnRyb2xsZXIncyBjYWNoZSBw
aGFuZGxlIGdpdmVzIHRoZSBjYWNoZSBsZXZlbCBhbmQKPiArICAgICAgICAgaWQsIHdoaWNoIHRo
ZSBkcml2ZXIgcmVnaXN0ZXJzIGFzIGEgcmVzY3RybCBjYWNoZS1hbGxvY2F0aW9uIHJlc291cmNl
Lgo+ICsKPiArICAgICAgICAgU2F5IE4gdW5sZXNzIHlvdXIgZGV2aWNlIHRyZWUgZGVzY3JpYmVz
IGEgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlci4KPiArCj4gK2VuZGlmCj4gKwo+ICBjb25maWcg
UklTQ1ZfQ0JRUklfUkVTQ1RSTF9GUwo+ICAgICAgICAgYm9vbAo+ICAgICAgICAgZGVmYXVsdCB5
IGlmIFJJU0NWX0NCUVJJICYmIFJFU0NUUkxfRlMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNj
dHJsL01ha2VmaWxlIGIvZHJpdmVycy9yZXNjdHJsL01ha2VmaWxlCj4gaW5kZXggYTc2MzE3MTJk
YmE5Li5jODMzOTExM2VmMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9yZXNjdHJsL01ha2VmaWxl
Cj4gKysrIGIvZHJpdmVycy9yZXNjdHJsL01ha2VmaWxlCj4gQEAgLTcsMyArNyw0IEBAIGNjZmxh
Z3MtJChDT05GSUdfQVJNNjRfTVBBTV9EUklWRVJfREVCVUcpICAgICAgICs9IC1EREVCVUcKPiAg
b2JqLSQoQ09ORklHX1JJU0NWX0NCUVJJKSAgICAgICAgICAgICAgICAgICAgICArPSBjYnFyaS5v
Cj4gIGNicXJpLXkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICArPSBjYnFyaV9kZXZpY2VzLm8KPiAgY2JxcmktJChDT05GSUdfUklTQ1ZfQ0JRUklfUkVTQ1RS
TF9GUykgICAgICAgICArPSBjYnFyaV9yZXNjdHJsLm8KPiArY2JxcmktJChDT05GSUdfUklTQ1Zf
Q0JRUklfQ0FQQUNJVFkpICAgICAgICAgICArPSBjYnFyaV9jYXBhY2l0eS5vCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9jYXBhY2l0eS5jIGIvZHJpdmVycy9yZXNjdHJsL2Ni
cXJpX2NhcGFjaXR5LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMDY3MGE2NzZiZGIxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcmVzY3RybC9j
YnFyaV9jYXBhY2l0eS5jCj4gQEAgLTAsMCArMSwxMjcgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICsvKgo+ICsgKiBQbGF0Zm9ybSBkcml2ZXIgZm9yIGEg
UklTQy1WIENCUVJJIGNhcGFjaXR5IGNvbnRyb2xsZXIgdGhhdCBiYWNrcyBhIENQVQo+ICsgKiBj
YWNoZS4gVGhlIGNvbnRyb2xsZXIgaXMgZGVzY3JpYmVkIGluIGRldmljZSB0cmVlIGJ5IHRoZSBn
ZW5lcmljCj4gKyAqICJyaXNjdixjYnFyaS1jYXBhY2l0eS1jb250cm9sbGVyIiBjb21wYXRpYmxl
IHRvZ2V0aGVyIHdpdGggYSBwaGFuZGxlIHRvIHRoZQo+ICsgKiBjYWNoZSBub2RlIGl0IGdvdmVy
bnMuIFRoZSBkcml2ZXIgaGFuZHMgaXQgdG8gdGhlIENCUVJJIGNvcmUsIHdoaWNoIHByb2Jlcwo+
ICsgKiB0aGUgY2FwYWJpbGl0aWVzIHJlZ2lzdGVyIGFuZCBleHBvc2VzIGEgY29udHJvbGxlciB0
aGF0IHN1cHBvcnRzIGFsbG9jYXRpb24KPiArICogYXMgdGhlIHJlc2N0cmwgY2FjaGUgYWxsb2Nh
dGlvbiByZXNvdXJjZSBmb3IgdGhhdCBjYWNoZS4KPiArICovCj4gKwo+ICsjZGVmaW5lIHByX2Zt
dChmbXQpICJjYnFyaS1jYXBhY2l0eTogIiBmbXQKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9jYWNo
ZWluZm8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZGV2
aWNlLWlkL29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pb3BvcnQuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3ByaW50ay5oPgo+ICsjaW5jbHVkZSA8bGludXgvcmlzY3ZfY2JxcmkuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKwo+ICtzdGF0aWMgaW50IGNicXJpX2NhcGFjaXR5
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJv
bGxlcl9pbmZvIGluZm8gPSB7fTsKPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2FjaGVf
bnA7Cj4gKyAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiArICAgICAgIHUzMiByY2lkX2Nv
dW50LCBjYWNoZV9sZXZlbDsKPiArICAgICAgIGludCBjYWNoZV9pZCwgY3B1LCByZXQ7Cj4gKwo+
ICsgICAgICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVN
LCAwKTsKPiArICAgICAgIGlmICghcmVzKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArClVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLCBJIHRoaW5rIHlvdSBjYW4gc2lt
cGxpZnkgdGhlIGNvZGUgYnkKdXNpbmcgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCku
Cgo+ICsgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAicmlz
Y3YsY2JxcmktcmNpZCIsICZyY2lkX2NvdW50KTsKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAg
ICAgICAgICAgICAgZGV2X2VycihkZXYsICJtaXNzaW5nIHJpc2N2LGNicXJpLXJjaWRcbiIpOwo+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGNh
Y2hlX25wID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJyaXNjdixjYnFyaS1jYWNo
ZSIsIDApOwo+ICsgICAgICAgaWYgKCFjYWNoZV9ucCkgewo+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIm1pc3NpbmcgcmlzY3YsY2JxcmktY2FjaGUgcGhhbmRsZVxuIik7Cj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNhY2hlX25wLCAiY2FjaGUtbGV2ZWwiLCAmY2FjaGVfbGV2
ZWwpOwo+ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IiVwT0Y6IG1pc3NpbmcgY2FjaGUtbGV2ZWxcbiIsIGNhY2hlX25wKTsKPiArICAgICAgICAgICAg
ICAgZ290byBvdXRfcHV0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAg
KiBBc3NvY2lhdGUgdGhlIGNvbnRyb2xsZXIgd2l0aCBpdHMgY2FjaGUgaW5zdGFuY2UgdmlhIGNh
Y2hlaW5mby4KPiArICAgICAgICAqIFRoZSBtYXRjaGluZyBjYWNoZSBwcm92aWRlcyB0aGUgY2Fj
aGUgaWQgdXNlZCBhcyB0aGUgcmVzY3RybAo+ICsgICAgICAgICogZG9tYWluIGlkLgo+ICsgICAg
ICAgICoKPiArICAgICAgICAqIFRha2luZyB0aGUgZmlyc3QgbGVhZiBhdCB0aGUgbGV2ZWwgaXMg
c3VmZmljaWVudCwgYmVjYXVzZSBmd190b2tlbgo+ICsgICAgICAgICogaXMga2V5ZWQgb24gdGhl
IERUIGNhY2hlIG5vZGUsIHNvIHNpYmxpbmcgbGVhdmVzIG9mIGEgc3BsaXQgY2FjaGUKPiArICAg
ICAgICAqIHNoYXJlIGl0LCBhbmQgcmlzY3YsY2JxcmktY2FjaGUgbXVzdCByZWZlcmVuY2UgYSB1
bmlmaWVkIHNoYXJlZAo+ICsgICAgICAgICogY2FjaGUgKGNhY2hlLXVuaWZpZWQpLCBub3QgYSBz
cGxpdCBwcml2YXRlIEwxLgo+ICsgICAgICAgICovCj4gKyAgICAgICBjYWNoZV9pZCA9IC0xOwo+
ICsgICAgICAgY3B1c19yZWFkX2xvY2soKTsKPiArICAgICAgIGZvcl9lYWNoX29ubGluZV9jcHUo
Y3B1KSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBjYWNoZWluZm8gKmNpID0gZ2V0X2NwdV9j
YWNoZWluZm9fbGV2ZWwoY3B1LCBjYWNoZV9sZXZlbCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBp
ZiAoY2kgJiYgY2ktPmZ3X3Rva2VuID09IGNhY2hlX25wKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY2FjaGVfaWQgPSBjaS0+aWQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArICAgICAgIGNwdXNfcmVhZF91bmxv
Y2soKTsKPiArCj4gKyAgICAgICBpZiAoY2FjaGVfaWQgPCAwKSB7Cj4gKyAgICAgICAgICAgICAg
IGRldl9lcnIoZGV2LCAiJXBPRjogbm8gb25saW5lIGhhcnQgcmVwb3J0cyBhbiBMJXUgY2FjaGUg
Zm9yIHRoaXMgbm9kZVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBjYWNoZV9ucCwgY2Fj
aGVfbGV2ZWwpOwo+ICsgICAgICAgICAgICAgICByZXQgPSAtRU5PREVWOwo+ICsgICAgICAgICAg
ICAgICBnb3RvIG91dF9wdXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaW5mby50eXBlID0g
Q0JRUklfQ09OVFJPTExFUl9UWVBFX0NBUEFDSVRZOwo+ICsgICAgICAgaW5mby5hZGRyID0gcmVz
LT5zdGFydDsKPiArICAgICAgIGluZm8uc2l6ZSA9IHJlc291cmNlX3NpemUocmVzKTsKPiArICAg
ICAgIGluZm8ucmNpZF9jb3VudCA9IHJjaWRfY291bnQ7Cj4gKyAgICAgICBpbmZvLmNhY2hlX2lk
ID0gY2FjaGVfaWQ7Cj4gKwo+ICsgICAgICAgcmV0ID0gcmlzY3ZfY2JxcmlfcmVnaXN0ZXJfY2Nf
ZHQoJmluZm8sIGNhY2hlX2xldmVsKTsKPgpBcyBJIG1lbnRpb25lZCBpbiB0aGUgY29tbWVudCBm
b3IgYW5vdGhlciBwYXRjaCwgdGhpcyBmdW5jdGlvbiBkb2Vzbid0Cm5lZWQgdG8gaGF2ZSAiX2R0
IiBpbiBpdHMgbmFtZS4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
