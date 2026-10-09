Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC71CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GB+7DWypJ4U5pZP7+Qawj1lGLaUPAXwcXMasVyCAuiM=; b=J7BOLM7DVpRIgk
	2cPjzIZBmI80KAX5dUsOMYbKz/zyj0LFBDuU2Q75Vxg0YrzoKT77lUk9t0vyslmRSIWNqaNxQpNRh
	ho+vyBIl1zEwMYaM+jZ+TgIpcRzFJd5cHB4ZiDwYBZSAJQUkrkWLImNOmSI6WBNMNZmf++Uj0Zbfv
	b8Nvz8vx2tNcDHehsAZjXFR0qNZ99+k05H1cZ0FkEN9dBpwoIWV/QBhW+1vvV9ekSbjJQKBDitqr0
	1tv/NCNAOabkAGIOyy7ylqDleSKxZWAXftNcbRByeUCID8HlTjGiTcqkxx+xvtEX72ZRKnrxBjGJg
	RH17gyjmrlkLX+3JbHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAtw-00000006Owl-1dHM;
	Fri, 09 Oct 2026 13:44:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAtt-00000006Ovr-1dXy
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 13:44:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKG2R3024033
	for <linux-riscv@lists.infradead.org>; Fri, 9 Oct 2026 13:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=; b=oNQzOqDfJ8E0CPBB
	Ja8vOPcar2eUVBtqsQBHGXD28HvyGnyzsjQ9uPF7ugOuJ4EissLWjdr+erCsSaRX
	5mDpDYapWDZqqMXPIhjE4O1vY+LzMX1RQdTP7kLU9psuxyyldBpNsAwy7R3vFaAE
	/K9bap81PxZ16S5dyAGRlNlAqdbtzkYUnhgDp4Mzq4HukEtqdpdP90vUiqHVlBkR
	hujCMycUkpxWfxYJ19O3QLes2JLvCe3kqohhszuorDMfg9Fwqa/PcdFXaXnrBQLN
	6YsJQXApC/yW09ZnMnR5pye3/K5ngUF270upxojLcm6/VIKvxNNHbXHgI2b/ePDT
	01ajHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwbt36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 13:44:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so106389236d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553480; x=1792158280; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=;
        b=dq24x8R+Nu2CP7SobIwK1Geckihme38K2uTV/l0gKm24QfC62ikvCfry/RNog6Ay+1
         dKulQcqNIZDXqqE6sfOrWqiKXBE2mqtFZh/RVxP1nRoyNGE7j/44Qk1GeV1uCCxLYF2u
         IpeJT4wi4elxPsWoElMecuVC4blEuh/wHYj+8IihQwAo1PEM9Rkq+3cy/ahTNxzhgiuR
         WyrgBbEaZQixkGCDLCNHr63oW2DQkmsOMdLJ+8Olzlnyb8kqDhDqoMw/Zi+wi/6BrHaq
         QLT3R6YeWAzCWzeFH2ZYDZ1VD/gfs/uIFoW1058xXnk45jdunWDujAGQ0d7VTlsdzs9V
         0gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553480; x=1792158280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=;
        b=Yq1tBIRfU1aJBZApOANEDLT2ycc/vMZDX1xKxcAqlXuJzVJto3zkB+lnC1NFk9uspq
         eSbgfwXXiNNlF/jgFYDrJ9T03zCYdV/dhITDHSFkndpoOcRHa0gio/qtAs7eAV83msnZ
         Ekpxvr9Kf9UWHgWq5R+ksruGDqhFPSD/SswfUudscv3Tvt8Lbq96XDqY8xuwdveo4OkF
         EVSN/nSOvvukIPYI+wfEsmn+eXv2WWxIlLYQ4PSaX03/N+OGHMwSoJLsKI2na0w+lQ0s
         H6FCpMYetYqRHo0ksymXCy8itCHRrkqcCnqu1wWtcW0cgHX3IhumcXHLoF0ayKxiuDGH
         rLCw==
X-Forwarded-Encrypted: i=1; AKwUvBxO+eoZtrNnTVXIjYBIo5b3+GswPkTqjQ6oYNrIkcghUO2can7cA/9yQwhvNU06qNpMNY40xK/zy8NT8w==@lists.infradead.org
X-Gm-Message-State: AFuF++mQvAY2TOH02Kh2WFV9hKtHuRq7HFOjPubz4ks3CDg5F8NMZC9E
	J/GZb/OITNlE1AHd1eH1H/IFaLfJpb5UJXVqjMwGYVsN9gX4qPtB5rWWdd5espOMoEKnawRz5iI
	SsC9FgBkXBuvfjhMMsnJTTd7loL3LEBNzyuyOY49XNed20ruQsHfldEFvEOKSzoKvSNf01gc=
X-Gm-Gg: AYBFou2eI5JOWe/rzgGa2JIIurdImCKrTPuA0dILr6jXYS8hAzTN7Sa6JslpxMeoj3j
	Ft0q5m8ye/FfXnmJJ4/vfPmviBEUnsvFq2eJGotVIBcOfluJ9QDXVu9iFbMcsozoqbuH/weJ1K7
	fLLApTnhk/K36RP0BvzG55xiy9Rj76vuwxQSfld8/Dt7ipr5tidTv1TtlDBQxchJsoL5SaR0hRk
	ckZIt5Bz1o1O5NqzpQd9zC7MVkazIetYKN5qNLZpeEWTDVuktvK65RiRlFdPrEC+fPCToVQyacJ
	WLc6YnpoMC91lsH/F809dViOmfig+d4qUOT/5rrXLgdeHPk0P39YA3vSwmuDVthU9jqft3Inglt
	n/RdsG/EbuJL2uvdgXY5/s4DUFLSQvgqFVTAdIA==
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr253478885a.57.1791553479683;
        Fri, 09 Oct 2026 06:44:39 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr253474985a.57.1791553479218;
        Fri, 09 Oct 2026 06:44:39 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm81608725e9.0.2026.10.09.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:44:38 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:44:37 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Message-ID: <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfX0EILJxmY2ApH
 +pdqsvLd2Wg5iPP1/7lGsbzZxXL8T9ZIoj4f9TJnrLoiW2iHmFdfUMDcyfbND1ucqEIHXpPzHo1
 ESEOfS5ASCXwZlW+HqUc8jzUGbZhWBLJHj3oHir4blu52mACGey1gx+ltnQxzofrvXh71xMCYy5
 X7Z/Y0DMakvwadosLPpKrhAu/j2gQtVZU4wGXZbWlNVp2/lwVUdqBKfdGt8eC4JF4h8gs9WJ3yc
 wxunmSNVgiYEbyZMLWMLnb523nKXuIFyjbuiJFLlNHVSH9+7B3oV/hpAV9wiwIgcOw21lXyALNN
 mOk3XLqFmMntOimON99U1PY191JwQ9jqMbGqbQFFPmn/byiNs6ZtDCqDB2e0awKtPBP4zGWfuBP
 BSIfx+D29F/U1DFkg7olWltz4qZRMbYjAEwppvibdhDY0Wr+dApTzBySmgY4GyPMWIgVN0RydQN
 xoR73Ixy8n0PyhwZnDQ==
X-Proofpoint-GUID: KMFt7oX6_lHIgE_otVw37z95b4P4y4RL
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8efc8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=98eIWfJVglYkh31htLYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfX6qQv97OaOlDT
 8vmwVhFuUY0UZ4VkDk0O9LfmCzuAt49uHILoik0wYOf6ZJCVZabWbPWHyPnOjPzALpQiZQ2tFwB
 q9MF3Ju2Qd1lrKZJz8dhQBR/IoH/HZE=
X-Proofpoint-ORIG-GUID: KMFt7oX6_lHIgE_otVw37z95b4P4y4RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_064441_441350_B2EF066B 
X-CRM114-Status: GOOD (  15.50  )
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

SGkgQW51cCwKCk9uIEZyaSwgT2N0IDA5LCAyMDI2IGF0IDAxOjQ1OjIwUE0gKzAyMDAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNTo1MeKAr1BNIEFuZHJldyBK
b25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4ga3Zt
X3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2NoZWR1bGVyIHBy
ZWVtcHRpb24KPiA+IG5vdGlmaWVyIHdoaWxlIHRoZSByYXcgcnVucXVldWUgbG9jayBpcyBoZWxk
LiBUYWtpbmcgdnNmaWxlX2xvY2ssIGFuCj4gPiByd2xvY2tfdCwgdGhlcmUgdmlvbGF0ZXMgdGhl
IGxvY2tkZXAgd2FpdC1jb250ZXh0IHJ1bGVzLgo+ID4KPiA+IFByb3RlY3QgdGhlIENQVS9IR0VJ
IHBhaXIgd2l0aCBhIHNlcGFyYXRlIHJhdyBzcGlubG9jay4gQWxsIHVwZGF0ZXMgdG8KPiA+IHRo
YXQgcGFpciByZXRhaW4gdnNmaWxlX2xvY2sgYW5kIHRha2UgdGhlIG5ldyBsb2NrLCB3aGlsZSBz
Y2hlZHVsZXItb3V0Cj4gPiB1c2VzIG9ubHkgdGhlIG5ldyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUg
dXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3YWtldXAKPiA+IHNldHVwIHNlcmlhbGl6ZWQgd2l0aCBW
Uy1maWxlIHB1YmxpY2F0aW9uIGFuZCByZWxlYXNlIHdpdGhvdXQgYnJpbmdpbmcKPiA+IHdpZGVy
IElNU0lDIG9wZXJhdGlvbnMgaW50byBhIHJhdyBjcml0aWNhbCBzZWN0aW9uLgo+IAo+IEluc3Rl
YWQgb2YgaW50cm9kdWNpbmcgYW5vdGhlciBsb2NrLCB3aHkgbm90IHJlcGxhY2UKPiByZWFkX2xv
Y2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgd2l0aAo+IHdyaXRlX2xvY2tf
aXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgaW4KPiBrdm1fcmlzY3ZfdmNwdV9h
aWFfaW1zaWNfcHV0KCkgPz8KClVuZm9ydHVuYXRlbHksIHdyaXRlX2xvY2tfaXJxc2F2ZSgpIGhh
cyB0aGUgc2FtZSBQUkVFTVBUX1JUIGlzc3VlLCBzaW5jZQpyd2xvY2tfdCBpcyBzbGVlcGFibGUg
b24gUlQgaW4gYm90aCBtb2Rlcy4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
