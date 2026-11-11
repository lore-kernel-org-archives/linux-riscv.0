Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64A606A33A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LghGiAza;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=coB/S3nB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtWM28s8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3oyiQCEJcTdK6WdagSEeOrWP7u597n+iVs3OfZgCLE4=; b=LghGiAza20g6spAPJOieWsb3Tj
	3GFHorNNq70pa70c6ALeeoYn20U7dwVmT2zxBIyrYy/6jNqsU+9qdoKMYhhcxtEulAcCDcnOHce54
	tYt+O8Olb9YEIQ5gcTMAZ1m3UYKVWzSm18JPSDkqy+4mW4awzpwhdHhV7qljg8+azdkKEFFEDxfNU
	r7WEJ6rVY9hUtZkwPU+kQP4FwA+5SwHyZtLT+5rCeS2kWVRVT3DfWUKmAVLJK3bX4CbBSvV5jifuX
	RXsknT3N9+rhedKmiyURi/5PReFtk1OkITigUx1MJtg/cZpkK8L+Y01BdggoH5pYjwkZXxBIz3gma
	2xDEZ6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8DA-00000006nbt-33fL;
	Wed, 11 Nov 2026 13:18:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8D7-00000006nbZ-26qk
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 13:17:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYrt21359056
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=; b=coB/S3nBGSl4q2Kk
	3wr8HinWmENbWSkl+ktWvEokd0uaXOHZD5r1L4pdmrD9RqOIboijjSGs2RrhBz0g
	k0Yy3AdesaWLHSV9WZ2S8/XT6kVK+7zo/29ILGUm+cGoLkKESh4oG5LicBSgUepG
	gOuGhzT4s+3+UxbmSZxl2J465UjQl5cYVqEA305oYDzxtIgqFOcbKds1lri7KQ5x
	CLjRdMIag+g81XJUgxcHX3h/IBxEKIRzhelxzPdNn9GANkql9BUhuQ6a+5XYgi6M
	rIKRHlWY4d84E6nG8niLy4VIJgJdCNKMMXOtT6wK2Mqo1/1yHXZKgZjEIqr3GHZF
	5yQaMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psd5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:17:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5364605e74bso82337061cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403076; x=1795007876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=gtWM28s84lfB0u70Q6lOf17ZTHmAyr0R9V5D577SV/yhvPLO+Fq+zrIy8O8c7W8Ie/
         BdFgpWkHIiq2OyGwjlE7s0N3GIbdCrv96txEXbR5OguXX5PinT6YzbVO110go9B7VTs6
         CEV7bMm8Qm6Ed8dYxXGwNR3BYG8ftwzRhYLrFJJP10J1RkmH1WHPkWc33Kw72sMqA6/P
         +DlxWsydQ3J72JmeNSL3fhq/Wql85QhaN/1dT8+EvMpeRexw++zUus4xCAP52RUfH5sD
         gPTI+dmPADg1hY5kxspgczXGjawEc6BHVIZMG1C8t4W9hubKYhzLxD8rwtH7b/4o9lPk
         jshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403076; x=1795007876;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=YmYd9Nm6gU3dfpCtyUrsjeEky4aQ2tIpeEUb6HXZDu3kOGX9nK5xdK/DcQ4xGUNsI9
         qfAYSxi7ZgE1+SErEkZ9QA23tl5+HDbwZkE54RytaKkAjzkhAp5Pgrx8xDbwlR5JMMsX
         M/VF7Azrq1bf3/0efG8wbqK9WkjOtuN9Ezr39YxSKacPYCIiLzUKMefOW6bvP6noTmfW
         HWAd6PRJLBkIZFGVwDaeVppXG6QW4lsXGzBhib8e6UQrd4+Jt6SbYmDvQPicNDMGtEYk
         IgczK0W+G0vSetk1FZDIqmVZEZ7uEzjLx5wo+1roVKvgIJ1D/RE3yxloMEErXYLktqOK
         iYng==
X-Forwarded-Encrypted: i=1; AL+hErFR1u3asOGfCd1eUaPDDSCPzC7WoKHTk8ONlxcwqr2ZPCDvVde9E62Tuvo6a/Y2VEp6/l36VEeGGqkHDQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/h5YlqCA0hSO+8A/6ZJuarz/a0Fl1m6TvA6nmOSeRtZLKFTzGn
	Ajv9OBlk71PQJymO2K7JMJUBE/iygnmGwXjyiR/24DTqMLqKVqUifvLfOsBIaN9du7NDi3YVMnm
	YTsANxOiARrygj1HpW4lsjNJnjq0CnkOF7sLMb36UXNPfJXEymBorfBrdTxP1f5wvBvzZFZw=
X-Gm-Gg: AYBFou03NUeYGLrjJvQvFj2srtiDXosoe99X4c46boUbUVYqzMAcger+NgeS4Xhto39
	eN16gNBgXUy/PpkH5QBbDntmWRzLBLN64UMRVa4lqpVztx/snjf0d2pOoRN+DOYzCmIguMdgt02
	db+GlRLXzUQspKsE2YnLchSTdsshGH7suHag2vKjRG8QZOQHESWXeJfI6sZIl/gOvfXNxVsWwVx
	4h+WYsbGnZmYa3u3i7klD+fMC0vhFpvJtpF7ycrRboVta7A6y2fe0CZMs022MCRWa+MNq2c2J0m
	pXGAuWGzFyzouu4bJCTlJRg0/0M874ygmKigITUO2UYY7O9yB7VU4U4zJlwUqTwapwyXu1CYvbx
	ncZ+nqzlr7tsUGQvX53XUq31CtsNrTBlOh7cjnO+58EOjN8OjcR5FKxl4UsKEFws4i7Wo3IunZM
	z7i/8kT56o+lMg0waF2dr2EK0yzVyz6wKqtSwBE3fyRP6jTCj2SFFxyEGwJuHGJ3UnIB72gZ0ig
	yYysOhgIeIR7oJzk4N9g9eqw0+UFM4qhYC+aQv0kKlE
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362250685a.1.1794403075692;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362244685a.1.1794403075158;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a57085fsm233201266b.22.2026.11.11.05.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:17:53 -0800 (PST)
Message-ID: <38b7e73d-71a8-49dd-85c7-7cc496c57c8c@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:17:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/wmi: Allow consumers to load without ACPI
To: Armin Wolf <W_Armin@gmx.de>, Han Gao <gaohan@iscas.ac.cn>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn>
 <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
Content-Language: en-US, nl
In-Reply-To: <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXx7LEjO/Abs2A
 5/FCW4MFVC0xrd0Z4OsQ0IeDqcrnfxFkzp24z43yXWvBXqJlTqnIFNDpAYXjJuIVr/hKnrcL0r9
 DpcsMeN6JLH7PBmsX8RXFsqrb2x1UZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX+7YeQkkv7n9M
 VEooBz4Xw/4c0H7nrin6+PieYPyeh07mdKdQLcrnqyzeQ5OHSakDk4U5/3UKeBeDxVUHnQ8yzHC
 qywYN3fcG8h85zsEwR2TVI1KdZphpFSlAN7CmNlpgAOZSo/+ZjuFKh5rvdMunvB1eKt06XEkaqV
 1UnGTEtVnuGuUPAgd6VFsAhlctV3HKO1wXaD+GFLEOQfePFR8QL3FICXLW73mfqnqxvh85w0riP
 uD9VnmfbBLp8vPVMOB4VpY8LH1QHuIwhA2AWCQtYrKcFoEH5RgYD+Kpt5qshOZKImWlPJipush4
 PZieYgU+nIKgqZC4ObFRTVpO0r8yFWiP8whgBJQNq10z6tq52mzUBch43NN4AZv3FoBnGdr6oEp
 tMDV5YH8caxKEQWyQmzdkpwnf+KxshptGZZuxLuykk4QHDwkhD9DcQF77xLeLBhmD0QqtqyEJ5j
 ItwzJ7HlbY2dB0wIKEw==
X-Proofpoint-GUID: zaqoLpJ7GkaTfPYXC9JLgcft9s4OtIAz
X-Proofpoint-ORIG-GUID: zaqoLpJ7GkaTfPYXC9JLgcft9s4OtIAz
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af46b04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9ttZ_nxh5X5bo92EjBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_051757_548701_1BAEB909 
X-CRM114-Status: GOOD (  20.67  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiAxMC1Ob3YtMjYgMTQ6NTcsIEFybWluIFdvbGYgd3JvdGU6Cj4gQW0gMTAuMTEuMjYg
dW0gMTQ6NDMgc2NocmllYiBIYW4gR2FvOgo+PiBTaW5jZSBjb21taXQgNGVhMThlNjA0MjcyICgi
QUNQSTogdmlkZW86IFJlbW92ZSBDT05GSUdfWDg2IGhhbmRsaW5nIGZyb20KPj4gbnZpZGlhX3dt
aV9lY19zdXBwb3J0ZWQoKSIpLCB0aGUgQUNQSSB2aWRlbyBtb2R1bGUgdXNlcyBXTUkgb24gYWxs
Cj4+IGFyY2hpdGVjdHVyZXMuIFdoZW4gQUNQSSBpcyBkaXNhYmxlZCwgZS5nLiBvbiBhIGRldmlj
ZXRyZWUgYm9vdCwKPj4gYWNwaV93bWlfaW5pdCgpIHJldHVybnMgLUVOT0RFViwgc28gdGhlIHdt
aSBtb2R1bGUgZmFpbHMgdG8gbG9hZCBhbmQgc28KPj4gZG8gdmlkZW8sIGFtZGdwdSBhbmQgcmFk
ZW9uLCB3aGljaCBkZXBlbmQgb24gaXQuCj4+Cj4+IFJldHVybiAwIHdpdGhvdXQgcmVnaXN0ZXJp
bmcgdGhlIFdNSSBidXMgaW5zdGVhZC4gVGhlIGV4cG9ydGVkIGhlbHBlcnMKPj4gdGhlbiByZXBv
cnQgdGhhdCBubyBXTUkgZGV2aWNlIGV4aXN0cy4gU2tpcCB0aGUgdGVhcmRvd24gb24gbW9kdWxl
IGV4aXQKPj4gYWNjb3JkaW5nbHkuCj4gCj4gQUZBSUsgd21pX2ZpbmRfZGV2aWNlX2J5X2d1aWQo
KSByZXF1aXJlcyB0aGF0IHRoZSBXTUkgYnVzIHR5cGUgaXMgaW5pdGlhbGl6ZWQsIHNvIHdlIHNo
b3VsZCBub3Qgc2tpcCBidXNfcmVnaXN0ZXIoKS4gSSB3b25kZXIgd2hldGhlciB3ZSByZWFsbHkg
bmVlZCB0byBjaGVjayBhY3BpX2Rpc2FibGVkIGFmdGVyIGFsbCwgYmVjYXVzZSB0aGUgcGxhdGZv
cm0gZHJpdmVyIHdpbGwgbm90IGJpbmQgYW55d2F5IGlmIEFDUEkgc3VwcG9ydCBpcyBkaXNhYmxl
ZC4KCkkgZGV2ZWxvcGVkIHRoZSBzYW1lIHBhdGNoIGluIHBhcmFsbGVsIHRvIHRoZSBvcmlnaW5h
bCBzdWJtaXR0ZXIsIGJ1dCBkaWQKbm90IGdldCBhcm91bmQgdG8gc3VibWl0dGluZyB0aGlzIHVw
c3RyZWFtIHlldC4KCkkganVzdCBzdWJtaXR0ZWQgbXkgdmVyc2lvbiwgd2hpY2ggZG9lcyBrZWVw
IHRoZSBidXMgcmVnaXN0cmF0aW9uIGhlcmU6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9wbGF0
Zm9ybS1kcml2ZXIteDg2LzIwMjYxMTExMTMxNjEzLjYyOTAtMS1qb2hhbm5lcy5nb2VkZUBvc3Mu
cXVhbGNvbW0uY29tLwoKUmVnYXJkcywKCkhhbnMKCgoKCgoKPiAKPiBUaGFua3MsCj4gQXJtaW4g
V29sZgo+IAo+PiBGaXhlczogNGVhMThlNjA0MjcyICgiQUNQSTogdmlkZW86IFJlbW92ZSBDT05G
SUdfWDg2IGhhbmRsaW5nIGZyb20gbnZpZGlhX3dtaV9lY19zdXBwb3J0ZWQoKSIpCj4+IFNpZ25l
ZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPj4gLS0tCj4+IFRlc3RlZCBv
biBhIEhpRml2ZSBQcmVtaWVyIFA1NTAgYm9vdGVkIHdpdGggZGV2aWNldHJlZSBhbmQgYW4gUlg1
NTAsCj4+IHdpdGggQUNQSV9XTUksIEFDUElfVklERU8gYW5kIERSTV9BTURHUFUgYnVpbHQgYXMg
bW9kdWxlcy4gV2l0aG91dAo+PiB0aGlzIHBhdGNoLCB3bWkgZmFpbHMgdG8gbG9hZCBhbmQgc28g
ZG8gdmlkZW8gYW5kIGFtZGdwdS4gV2l0aCBpdCwKPj4gd21pLCB2aWRlbyBhbmQgYW1kZ3B1IGxv
YWQgYW5kIHRoZSBSWDU1MCBpcyBpbml0aWFsaXplZC4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvcGxh
dGZvcm0vd21pL2NvcmUuYyB8IDYgKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZv
cm0vd21pL2NvcmUuYyBiL2RyaXZlcnMvcGxhdGZvcm0vd21pL2NvcmUuYwo+PiBpbmRleCBhOTlk
YTliNzAzOWQ3ODdjZTNjMWUwZWNlNzRmZmJkNzlmYWZkM2Y3Li42NjY4Nzg5OTA0YTkwM2M4ZDRl
NzgxMDk3NmY0ZTQ4NWQ3YTFiMzJhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3dt
aS9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS93bWkvY29yZS5jCj4+IEBAIC0xNTk4
LDggKzE1OTgsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3dtaV9pbml0KHZvaWQpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCBpbnQgZXJyb3I7Cj4+IMKgICvCoMKgwqAgLyogQUNQSSB2aWRlbyBz
dGlsbCBuZWVkcyB0aGUgZXhwb3J0ZWQgaGVscGVycyB3aGVuIEFDUEkgaXMgZGlzYWJsZWQuICov
Cj4+IMKgwqDCoMKgwqAgaWYgKGFjcGlfZGlzYWJsZWQpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVOT0RFVjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCDCoMKgwqDCoMKg
IGVycm9yID0gY2xhc3NfcmVnaXN0ZXIoJndtaV9idXNfY2xhc3MpOwo+PiDCoMKgwqDCoMKgIGlm
IChlcnJvcikKPj4gQEAgLTE2MjgsNiArMTYyOSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjcGlf
d21pX2luaXQodm9pZCkKPj4gwqAgwqAgc3RhdGljIHZvaWQgX19leGl0IGFjcGlfd21pX2V4aXQo
dm9pZCkKPj4gwqAgewo+PiArwqDCoMKgIGlmIChhY3BpX2Rpc2FibGVkKQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuOwo+PiArCj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1fZHJpdmVyX3VucmVnaXN0
ZXIoJmFjcGlfd21pX2RyaXZlcik7Cj4+IMKgwqDCoMKgwqAgYnVzX3VucmVnaXN0ZXIoJndtaV9i
dXNfdHlwZSk7Cj4+IMKgwqDCoMKgwqAgY2xhc3NfdW5yZWdpc3Rlcigmd21pX2J1c19jbGFzcyk7
Cj4+Cj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogNzQ3NWVhOGI1ODYxNmIzM2MwNGFmYjk3NmNmMGZi
YWFkOWRkNjNmYgo+PiBjaGFuZ2UtaWQ6IDIwMjYxMTEwLXdtaS1uby1hY3BpLTE1OWE0Y2YxOTU4
MAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
