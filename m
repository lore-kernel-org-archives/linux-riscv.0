Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE7ACA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 06:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7oi6YrM4sGuxOogzVc4qhP7ZrOeRBbxxktdD2SSN/t4=; b=3Dub6pqZxsrKQn
	56orrv6QF73wkEq89Yl+j2fmPQVu7xSSqHWEfYQI7Qk7CB8iwDI7Xmk7MOejAis90ooDseTBjOTsQ
	yv4QwMviGS0L0L5TzIoQp4LaWpMu77yGJkQrO9HN+fiXerYUNE1stD3zxweF2ywtuuiO4N4ChMPfZ
	ZcHo1QWQ3b44PPDidxj+NX+tWTAeoXPTryyXdJ67Sy1Xcj18Kwa2eGm/Yh/2+xI9TftQTjR8fKMJN
	r5+FlSccMq0a8Tt4PYYLmIzuUJ4A9RkG31I58JRCIdoPa8Tdmcd7JSmkNSG1658xw/alO2XB+AJHh
	TcrkdVIgMxv67A+zhKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhPi-00000003cqT-0nJT;
	Thu, 08 Oct 2026 06:15:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhPf-00000003cq4-3SrQ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 06:15:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bktr1158323
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 06:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=; b=INS536GRqXgAyLEv
	LXBkqnEE6CLJX5tPvxB/ATYuK87GnsHHOm42VV/lFWu1MectcBvxMG7qlQx+uq/r
	Rgrx8MJJdy3yZkb9LuEgUPblFU28n+BpMQiFObFIG0NWNb80v8wfUW18Uh5sCPl7
	PEt3rQBll2kWsCuqyIXQHBn/jrqFqxGuQliMfhQkgUQlf2lkcMg4UKAPZUOQjJB1
	WAKJLI83F7Ko7gHA2OwwSO82iQU/F/kWQF4XZlXhwrPY1pRaTHj5osCgOqHInTgq
	iao0ZXO1hn+3l6Cj04JvpJOfjH/Voq05l+C1UJEav7/NHP7J0rbedfyfFJzF1xUc
	nuNerA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51dsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 06:15:30 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67692931213so7634745d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 23:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791440129; cv=none;
        d=google.com; s=arc-20260327;
        b=G56IWOoJXbXCV/erD68LiJSUYL+y1YMZLfPYHFqULPZI0mZud9Ur98hhVBbkvE9ex7
         IJiQMLwZLjl7aP0O1heybPl0LfjFFwLt9T9iLg7veIFtCzdqidqSiMUynIItSZCc8Iyo
         ce4zn0+Z2bMIiqV+vgte4QmZYsKKkDjjomWVaFJ18D/xMFevjzdw2jtTrmBdl0uH11BK
         Npl1he+erlXc+Y8hsmGoH/DLl68p3HA69I90tXAhBSUt//nVrCFv1MvNwiHdvplw4mSu
         pmQ+z0VIxW/QD7vrpJ5Hc9WzeoPBSL/XgA8ruWgJKXANAHinpJpe57d4cGSMLs+Ab5WB
         F8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        fh=Zcu28r0WdJFcPa0XwuvJlpammMJfPD2UBkNInpJrOCI=;
        b=Ntlc7CcC+KqgRUshFmfqBo3IzDeQbpaaZSYqkvinYIy8XPuXMh+IDVxOA5tvJLFjGM
         XuHRxVh3QHkv6CQz3vFH3k/b5GwY3sVtBx9Umz/j0J8kYZ5OSuUxu9UZjrtfYrTsdTZf
         J9cqXdxN1KiKb/2R1m6E1c/9yGkEcAVUd6UtazrWGpcE2Bapb3/yZrXtAAqq5I/cNsC4
         ls3OoXGOqofsl1AXFrKQBFUa39KRNgAaPY2dD6yyEaS2fdHywNwzMXH8onNf08HvjyeA
         QWfA3OAM2AHs7w5UINvsYF44okLjDNtDwAD+GEapSW5i4uTfE+jsyGACG3va1LDwVQ+q
         zOIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440129; x=1792044929; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        b=jVCq3rOJYZaT3XnD05hgEY5xuLOxMzSRjsN92HLM2cMERYEZvkbD5YfcnkIPi7clj/
         3tbLkdXAKrCBLmtVbTjUNvPEj/rLRQEAM58r9DfCT6MMPNdTJBJCtlpw7k0ay78KbG6j
         JTx40nsITEgeVRan+vyPST+orJCuSczBoxhVzSyOHylpr37aQwwdn+hn3gI7n3x2GRFc
         6FW9/+ZHaeqHVGmX9vkU3xQy7QOIj83BMHX/ejL1rDncJ7+zY2GaiuzDpHesh1OYI3Qb
         8sLX/+jZg9kRz7cFrb2SwHTgXsPJtrTnxuEqGH4yXD/E2vJHuupt/v0nNOHJZQlArUOW
         oDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440129; x=1792044929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        b=uE+aeZZ813m+uFxzMuxLsn3rJKNURKVyIa5/xOOr9xB4j00W5gxKhHPpM/+BkF1Rr9
         F7QC/k6kFWV31c80DvmBn09vzteUHSTmQYfz+fPSgXuPgIl1w9273xsMnf7Vgiq8EBwe
         1ocSBc6/Xcf7AqDjZuNceP9gmR+c7FFnYvPhq0HCfe6SNzp8ShybeuRmg9nZL79EnPxy
         rH9Ukn42vfciFVdFO6V1WIy383mm29mvFCMli1D+hLFYpJwSz5ai2IV+k/4mf3dz+H+r
         2CX7fbKsi1PB3l9mp6B06zuKoVOWfNNSWEQmD4MAsZtLq9zS12AU9nV6sMPEoC1iPxVS
         7LAg==
X-Forwarded-Encrypted: i=1; AKwUvByH/je0Kg2bE65x6g3R1ZKoP5KQErsTAfKSz5Pi2Zo9sreCgyVWQ9XMIkdvBQDC8CPCRNsscb6jgcTD3w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJq56SPeZa2amGVWhcvXLTSTLmXYDkK4n6gwxIIiVgoRpIszFwC
	Vr2tLjUiDgtAIZ1SV1jAk9gGW5lDQzsTlPSNrQBD3vYmgl+IZPQ1zQGIti/cUSLexjvSqbbXiPt
	ROsAOxUB7bvF67M/XKyGFveXPkqwrmlq3F37PXhCXBPTnUPMKWQPUoRqYizLyBGUIpiH/PW9NID
	sWeNcPgl7PVY3slPlA8aU0anCkKozM2GR5anrXqu3Jy68xpw==
X-Gm-Gg: AYBFou3m5hX/ajmHtI2t+5AU1DHkdkFP6gx0QRpeAPEp7rROArBqPcs1YMoe/s/+7hL
	y9spULapgc4l6f5tn1x1KTfFEa0R2d7B7REGKMFnJJQzVmqQ1WZ3AsNciamsnQ58ymZkk0KcCky
	EJBGdukRqPhtR7wTgyktCSf1PRxIDrsKw2nu1nxVBNXIfResJYfNEWo+I=
X-Received: by 2002:a05:690e:dc6:b0:673:1df3:86b2 with SMTP id 956f58d0204a3-6790a355225mr2466153d50.66.1791440129053;
        Wed, 07 Oct 2026 23:15:29 -0700 (PDT)
X-Received: by 2002:a05:690e:dc6:b0:673:1df3:86b2 with SMTP id
 956f58d0204a3-6790a355225mr2466145d50.66.1791440128574; Wed, 07 Oct 2026
 23:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:15:15 +0200
X-Gm-Features: AclHuK82G-aF0C4QrmEtOvpam9RmR-zAfqfbN8QwUZKZhMnDhKts1Wbg9cYmunk
Message-ID: <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
X-Proofpoint-ORIG-GUID: 953AI__w_9WSBQ6SxVyw31KbCe_9y0Es
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73502 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=etr3aXc5xdJg75Mw1ecA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXxmXmE/tu3NVQ
 27xexdNfjaTTve/iPpzF3CKTfbG/5CIkCmqcLm3fUGAFzjDogan/rQGp2tbwDqntZB8vpzZP+I8
 NBnC/ppw/vYcjUWgCkwJcwd/nSVLv/w=
X-Proofpoint-GUID: 953AI__w_9WSBQ6SxVyw31KbCe_9y0Es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8CxntcGWwYOq
 JyJqJ5i6zE53hT/OKUDJVjIpo8/3pIcN/uboAX78tZHgf6BLHGV7pU0W5xH1HxRZBiaUuqSEfGE
 1RUcQ6qMwkYeFZnQWc289GvepdQhGeDWOwv78JOn40sqW/nukmjv0U1gqDAR+RF9S9qCSWVNFOb
 MgS2VgqyLNc3VrgtX9p4EaxgWoJd27uTx+VsHTgInGkn3qcPX52jIkEqeFe84bWAuzzhypI0sx/
 7G5m4KKDCh3UsaxVhfBOT/MLFATJc4mo7uYrydWL9+MG7jMqlUiL8axVVenJbbsXHo7quaGoawI
 FKvzOG7c+ozJBMNlb452pKTh6NgCg7DsT0kd88NU4nXLDn+lJcIteniJnwS6LZjC73WF5Sh3Nvv
 3vRKnpuKgyGygr7Xkd79BRYTy0wbw8An9xDl2mDAK04pggPA38ZPNNpMiZ4b5kXa54ABEHMCczW
 cmKqp8xgHp1COvlc5YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_231531_876459_6DDC0C4E 
X-CRM114-Status: GOOD (  25.42  )
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

SGkgQW1pciwKCk9uIFR1ZSwgT2N0IDYsIDIwMjYgYXQgMjozOeKAr0FNIEFtaXJyZXphIFphcnJh
YmkKPGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNl
cmllcyBhZGRzIGFuIFJQTUkgYmFja2VuZCB0byB0aGUgT1AtVEVFIGRyaXZlciBmb3IgUklTQy1W
Lgo+IEl0IGJ1aWxkcyBvbiB0aGUgc2VwYXJhdGVseSBwb3N0ZWQgUlBNSSBURUUgdHJhbnNwb3J0
IHNlcmllcyBbMV0sCj4gd2hpY2ggcHJvdmlkZXMgc2VydmljZSBkaXNjb3ZlcnksIHN5bmNocm9u
b3VzIGNhbGxzLCBtZW1vcnkgcGFyY2Vscwo+IGFuZCBhc3luY2hyb25vdXMgc2lnbmFscy4KPgo+
IFRoaXMgcmV2aXNpb24gaXMgZWZmZWN0aXZlbHkgYSBmdWxsIHJld3JpdGUgb2YgdGhlIG9yaWdp
bmFsIFJGQy4KPiBUaGUgZ2VuZXJpYyBSUE1JIHRyYW5zcG9ydCBoYXMgYmVlbiBzZXBhcmF0ZWQg
ZnJvbSB0aGUgT1AtVEVFIGJhY2tlbmQsCj4gYW5kIHRoZSBiYWNrZW5kIGhhcyBiZWVuIHJld29y
a2VkIGFyb3VuZCB0aGUgc2VydmljZSBidXMgYW5kIGEgbmV3Cj4gT1AtVEVFIGNvbnRyb2wgQUJJ
Lgo+Cj4gVW5saWtlIHYxLCB0aGUgT1AtVEVFIGJhY2tlbmQgbm8gbG9uZ2VyIG1hbmFnZXMgU0JJ
IE1QWFkgbWFpbGJveAo+IGNoYW5uZWxzIG9yIGltcGxlbWVudHMgUlBNSSBURUUgc2VydmljZS1n
cm91cCBvcGVyYXRpb25zIGRpcmVjdGx5Lgo+IEl0IGJpbmRzIHRvIHRoZSBPUC1URUUgc2Vydmlj
ZSBVVUlEIG9uIHRoZSBSUE1JIFRFRSBidXMgYW5kIHVzZXMgdGhlCj4gdHJhbnNwb3J0J3MgcHVi
bGljIG9wZXJhdGlvbnMuIE5vIGFkZGl0aW9uYWwgT1AtVEVFIGRldmljZS10cmVlIG5vZGUKPiBp
cyByZXF1aXJlZC4KPgo+IFRoZSBiYWNrZW5kIHJldXNlcyB0aGUgY29tbW9uIE9QLVRFRSBzZXNz
aW9uLCBzaGFyZWQtbWVtb3J5LCBhcmd1bWVudAo+IGNhY2hlLCBjYWxsIHF1ZXVlIGFuZCBSUEMg
aW5mcmFzdHJ1Y3R1cmUuIFNoYXJlZCBtZW1vcnkgaXMgcmVwcmVzZW50ZWQKPiBieSBSUE1JIHBh
cmNlbCBJRHMgYW5kIG5vbmNlcy4gWWllbGRpbmcgY2FsbHMgcGFzcyBjb21tYW5kIGFuZCBSUEMK
PiBidWZmZXIgcmFuZ2VzIHdpdGhpbiBhIHBhcmNlbCBhbmQgcmVzdW1lIHN1c3BlbmRlZCBleGVj
dXRpb24gdXNpbmcKPiBhbiBvcGFxdWUgdG9rZW4gcmV0dXJuZWQgYnkgT1AtVEVFLgo+Cj4gVGhl
IE9QLVRFRSBjb250cm9sIEFCSSB1c2VzIGZpeGVkLXdpZHRoIGxpdHRsZS1lbmRpYW4gbWVzc2Fn
ZXMgY2FycmllZAo+IGluIFRFRV9DQUxMIHBheWxvYWRzIHJhdGhlciB0aGFuIHJlcHJvZHVjaW5n
IEZGLUEncyByZWdpc3Rlci1iYXNlZAo+IG1lc3NhZ2UgbGF5b3V0LiBBc3luY2hyb25vdXMgbm90
aWZpY2F0aW9ucyB1c2UgYW4gYWxsb2NhdGVkIFRFRS10by1SRUUKPiBzaWduYWwgYXMgYSBib3R0
b20taGFsZiBkb29yYmVsbCwgd2hpbGUgb3JkaW5hcnkgbG9naWNhbCBub3RpZmljYXRpb25zCj4g
Y29udGludWUgdGhyb3VnaCB0aGUgY29tbW9uIFJQQyBwYXRoLgo+Cj4gTWF0Y2hpbmcgT1AtVEVF
IE9TIHN1cHBvcnQgZm9yIHRoaXMgQUJJIGhhcyBub3QgeWV0IGJlZW4gaW1wbGVtZW50ZWQuCj4g
VGhpcyByZW1haW5zIGFuIFJGQyBmb3IgcmV2aWV3IG9mIHRoZSBiYWNrZW5kIGludGVncmF0aW9u
IGFuZCB0aGUKPiBMaW51eC10by1PUC1URUUgcHJvdG9jb2wuCj4KPiBbMV0gUlBNSSBURUUgdHJh
bnNwb3J0IGRlcGVuZGVuY3k6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3AtdGVlLzIwMjYw
OTI4LXJpc2N2LXJwbWktdGVlLWFiaS12MS0wLTA0OTA4YjgxZDg4NUBvc3MucXVhbGNvbW0uY29t
Lwo+Cj4gU2lnbmVkLW9mZi1ieTogQW1pcnJlemEgWmFycmFiaSA8YW1pcnJlemEuemFycmFiaUBv
c3MucXVhbGNvbW0uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBFZmZlY3RpdmVseSBy
ZXdyaXRlIHRoZSBiYWNrZW5kIGFyb3VuZCB0aGUgc2VwYXJhdGVseSBwb3N0ZWQgUlBNSQo+ICAg
VEVFIHRyYW5zcG9ydCBhbmQgYSBuZXcgT1AtVEVFIGNvbnRyb2wgQUJJLgo+IC0gUmVtb3ZlIGJh
Y2tlbmQtb3duZWQgcGVyLWhhcnQgbWFpbGJveCBjaGFubmVscyBhbmQgdGhlIE9QLVRFRS1zcGVj
aWZpYwo+ICAgZGV2aWNlLXRyZWUgYmluZGluZy4KPiAtIFJlcGxhY2UgdGhlIHJlZ2lzdGVyLWxp
a2UgY29udHJvbCBwYXlsb2FkIHdpdGggZml4ZWQtd2lkdGggbWVzc2FnZXMsCj4gICBleHBsaWNp
dCBjb21tYW5kL1JQQyBidWZmZXIgcmFuZ2VzIGFuZCBvcGFxdWUgcmVzdW1lIHRva2Vucy4KPiAt
IEFkZCBhIHBhcmNlbC1yZWZlcmVuY2UgcGFyYW1ldGVyIGxheW91dCBjYXJyeWluZyB0aGUgcGFy
Y2VsIElELAo+ICAgbm9uY2UsIGFuZCA2NC1iaXQgb2Zmc2V0IGFuZCBzaXplIHdpdGhvdXQgY2hh
bmdpbmcgcGFyYW1ldGVyIHNpemUuCj4gLSBNYWtlIGFyZ3VtZW50LW9mZnNldCBzdXBwb3J0IHBh
cnQgb2YgdGhlIGJhc2VsaW5lIEFCSSBhbmQgcmV0YWluCj4gICB0aGUgY29tbW9uIHNoYXJlZCBh
cmd1bWVudCBjYWNoZS4KPiAtIFVzZSBhIHRyYW5zcG9ydC1hbGxvY2F0ZWQgc2lnbmFsIGZvciBh
c3luY2hyb25vdXMgYm90dG9tLWhhbGYKPiAgIG5vdGlmaWNhdGlvbnMuCj4gLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTEyLXJwbWktdGVlLXNlcnZpY2UtZ3Jw
LWRldi12MS0wLTFkMWQzNWMyYTg1OUBvc3MucXVhbGNvbW0uY29tCj4KPiAtLS0KPiBBbWlycmV6
YSBaYXJyYWJpICg4KToKPiAgICAgICB0ZWU6IG9wdGVlOiBhbGxvdyBSUE1JIHRyYW5zcG9ydCBi
dWlsZHMgb24gUklTQy1WCj4gICAgICAgdGVlOiBvcHRlZTogZGVmaW5lIHRoZSBSUE1JIGNvbnRy
b2wgYW5kIHBhcmNlbC1yZWZlcmVuY2UgQUJJCj4gICAgICAgdGVlOiBvcHRlZTogYWRkIFJQTUkg
c2hhcmVkLW1lbW9yeSBhbmQgcGFyYW1ldGVyIHN1cHBvcnQKPiAgICAgICB0ZWU6IG9wdGVlOiBh
ZGQgUlBNSSBkeW5hbWljIHNoYXJlZC1tZW1vcnkgcG9vbAo+ICAgICAgIHRlZTogb3B0ZWU6IGFk
ZCBSUE1JIFJQQyBoYW5kbGluZwo+ICAgICAgIHRlZTogb3B0ZWU6IGV4ZWN1dGUgeWllbGRpbmcg
UlBNSSBjYWxscwo+ICAgICAgIHRlZTogb3B0ZWU6IGJpbmQgUlBNSSBzZXJ2aWNlcyBhbmQgbmVn
b3RpYXRlIGJhY2tlbmQgY2FwYWJpbGl0aWVzCj4gICAgICAgdGVlOiBvcHRlZTogc3VwcG9ydCBS
UE1JIGFzeW5jaHJvbm91cyBub3RpZmljYXRpb24gZG9vcmJlbGxzCj4KPiAgZHJpdmVycy90ZWUv
S2NvbmZpZyAgICAgICAgICAgICAgIHwgICAgMyArLQo+ICBkcml2ZXJzL3RlZS9vcHRlZS9LY29u
ZmlnICAgICAgICAgfCAgICAzICstCj4gIGRyaXZlcnMvdGVlL29wdGVlL01ha2VmaWxlICAgICAg
ICB8ICAgIDEgKwo+ICBkcml2ZXJzL3RlZS9vcHRlZS9jYWxsLmMgICAgICAgICAgfCAgICAyICsK
PiAgZHJpdmVycy90ZWUvb3B0ZWUvY29yZS5jICAgICAgICAgIHwgICAxMCArLQo+ICBkcml2ZXJz
L3RlZS9vcHRlZS9vcHRlZV9tc2cuaCAgICAgfCAgIDM4ICstCj4gIGRyaXZlcnMvdGVlL29wdGVl
L29wdGVlX3ByaXZhdGUuaCB8ICAgNTQgKy0KPiAgZHJpdmVycy90ZWUvb3B0ZWUvb3B0ZWVfcnBt
aS5oICAgIHwgIDIzNCArKysrKysrKwo+ICBkcml2ZXJzL3RlZS9vcHRlZS9ycG1pX2FiaS5jICAg
ICAgfCAxMDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgOSBmaWxl
cyBjaGFuZ2VkLCAxMzg5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKVGhlIHJwbWkg
Y2hhbmdlcyBpbiB0aGUgb3B0ZWUgZHJpdmVyIGhhcm1vbml6ZSBxdWl0ZSB3ZWxsIHdpdGggdGhl
CnJlc3Qgb2YgdGhlIGRyaXZlciwgYnV0IHRoZXJlIGFyZSB0d28gdGhpbmdzIEknZCBsaWtlIGZp
eGVkOgotIGF2b2lkIDxsaW51eC9jbGVhbnVwLmg+IG1hY3Jvcy4gVGhleSBhcmUgZGlzdHJhY3Rp
bmcuCi0gdXNlIHJjIGZvciB0aGUgdHJpdmlhbCBpbnQgRVJSTk8gdmFsdWVzLgoKSSB3b3VsZCBi
ZSBncmVhdCB3aXRoIGEgUUVNVS1iYXNlZCBlbmQtdG8tZW5kIHByb3RvdHlwZSB0byBkZW1vbnN0
cmF0ZQp0aGF0IHRoZSBBQkkgd29ya3MuCgpNb3JlIGNvbW1lbnRzIHRvIGNvbWUgaW4gdGhlIGlu
ZGl2aWR1YWwgcGF0Y2hlcy4KCkNoZWVycywKSmVucwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
