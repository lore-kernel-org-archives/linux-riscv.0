Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB426606B404
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3ariGMc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjsXn9fX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSeVgjO7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=msRrutg23Pa5bY58UeiOpEl4f1clWmFip8WF+4qv7ps=; b=a3ariGMc2Oa0AcvZFd4UWOFLc+
	G1PKnxi72Q1i/YjnA/Z0lXPe6XEypHRJxJC/vL8yy/s1kpuMg4s6C/OKqFAzNKMNt8VF1BRQtdEu/
	a3pkrl2hpoU3VGIDLzypziDRyHw2ydK6PXlmqfg9vOAzD/DYjn4iyK9qojFng6zZy47ntuMlNinoa
	F6hDNRh6Of45mQFjZrhiyZ+OKiUKD4DC6uElBA2Et7x45nc/z4DOxJXL2+XCLBwQnX7FFlED5DY0l
	m7NGQtYLYQYaIW4lDxN/lKUeCwv4XIqp/pMAJWJN51YoqiY8kWDJNLEY85Toxhw27VFauk9rGj0uH
	KeRP9syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3M-00000004jDn-2HYZ;
	Tue, 10 Nov 2026 17:54:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3K-00000004jD2-3wt2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0APB3183330
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=; b=IjsXn9fXScvVdZQC
	bApBGEWdq5mPNkgNa6GXlspDLjIEIfr23cl9dl9pbHBTlTozb7OOih6u36KU8bir
	YPhOdhabyrW0u18Mfx9ZAo7JKh0HEVknEhE8q+U7KdQexe+qtv+j7qc4aBLLdF0I
	0mju0p8cN9IzJAFYpMKgeApJKfINvvQyi7LJLEfbwqO9bIw2rOTexOY7uRAKQdw4
	pF9+k86QWpWCJytJb4tFgQfBAPbnhVFRNWyI2lgk1wQ5edEtprjFtcAcBjV0RPF7
	kw+IIP639maZkzsDfcAxEnJSlT2u7i5Bg6+jtPj0JO5Fb+TUiHChvlxs4GDlgzon
	ouUBuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp37bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so454128385a.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333277; x=1794938077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=;
        b=RSeVgjO7ssQwY7sFMvYbFujk8GFW22bfV6RGh2zDl/2W2LsPF5IJiuQ/DpyeESsiFK
         IefUSe4YvfWW4pA3hFGR78XYMljoxVih8du7yI6oIxaMrasBX5YMiSulxVtVOfzHv3Yw
         YjXslVoQ68SO0tlGK0B0Kp16nYZ8gbnkIb61qZsFye+xa6tKERHAfdWgczmJ6o2zS5PQ
         Yb+vtPsQ3XUW84xTnZtj78/AVGznWVp0xnnKANTOW1G4gsU/emak7RA8g0vSVVJ+J5tD
         lBz6lPzzCdyq92F8S/HKTTE4YVYXbWQHYgeq0SB7tIepfhKMCho3RZ6q/soQPwmIOct6
         gipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333277; x=1794938077;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=;
        b=PylXcurMgMUVD/82HrbUlypWTTf6gqagdDgCplDCGJPk3zm59O9A8vSi9WS4X14AqA
         MAubZik7/N1719AP6vW3ysBHwR6nR+/ydoBkdr/fwexb/W+gg5clUMwHcitm/IkC+3pW
         r+9B6oKnJe/5GN5TMRlojeZKlws2+hSLWhzTWlgRViY5yAPRJUL4/sTP+ND0SbAIxzki
         fi/Kpd5jxVBlBwNKBygy51dFPZsm9fr4pZ2JlFza4+MmEWOHuH+9DBXsWHi47Uin4FDk
         DZv0CF8zKe6V0bpkNhsm9Z82C4a6n9rb4C7olR4FY0Zt1YPziLtAXtXucK5qL0fIjjY7
         iv/w==
X-Gm-Message-State: APuU4Z/zgAOvSSSXpsfKwAYRmWrBG6vUPfeGv71Qeo9yq5sBwvsVptLE
	j3kIn+KUULhtbAWIBuReXFT835y0az3MSNPhIpD7mFeH9SgZ0Dg1HmXWnsPEv8VgHrg3Jiucu5e
	xTrITQrrL9P5Rw7O2wt2oTbLSp2ontfsK4/4TZy0umX7nXtlUCenHQiJ4rN9VmtLFQlT94dppxa
	n0AGQ=
X-Gm-Gg: AYBFou21CuwxkG394NvUvnImn/7UZ+u5TUCMV0EWiDUfWnxQh9mXqIXSjo06U5An5H0
	+PlcYaP3+OoD2AcYblx6+qwY+10udWwty3C4jZKoGLNqmGwundxO2H/kZfnyh3oNetoyLcF+hN5
	kTw4Fyi6laOEtND3KNl/b2WGxMDKInWNAj00Zn/Xmfp4NcsbCqW85TBRddgpakWxcqVz+ODSuTo
	JdS1Ao2IOEnHmlPJ7E7BYz8vSOev8Mx7hRySJ4AS7LS88kteEzO+oA3ycqxwm4058q0tlZYWHjN
	FHTG0C4fGbERE+c8eFAyrdM2bsNTmEKDEpl2S+xtMGWbk0dylJtDCdIR4eCJnHraXcLYOxGargt
	GERw6RDkuG72u5uZ3bnmTy3lWP2TMNaLJa/quwYpfiy5XCbpYMni4p5CxzdWAmMS1B4+g7oO+bG
	cf7M477lAXDQ0=
X-Received: by 2002:a05:620a:1a21:b0:944:d7b:e7a with SMTP id af79cd13be357-9479f374040mr564427485a.52.1794333277171;
        Tue, 10 Nov 2026 09:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:944:d7b:e7a with SMTP id af79cd13be357-9479f374040mr564424285a.52.1794333276666;
        Tue, 10 Nov 2026 09:54:36 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm6294321f8f.12.2026.11.10.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:35 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 4/6] riscv: hwprobe: Report Supm only when available
Date: Tue, 10 Nov 2026 18:50:46 +0100
Message-ID: <20261110175048.82208-5-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: FZ208XmUByRv0BTxcJ_HnSQjn4B8lgQi
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af35a5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xh6Lp3ypGm9RrBZCGgEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzg+aShLOIdfG
 EvC1agUVcsR3u2QqHg9VFTmN1BEe3eDzyFP7srsIy9u7bh0HX7jjcBoxhkYlhett6NEv5HgAPUf
 1m5F1WfHSelloAIVRKmAXai/+KsKB0sSirBYl5EDN/sTZI4ZXeO4MUekMDQT0QmBO7yIMrdfb7q
 J3HcPg5d778CsL0JbDZqRU48clbDTckJQkeOambaYqYwLcT0Lb9K5PqBRLvYeSJioMwiVwgoG+M
 vdr1Kec+PwqsW3kgnOLdOZ6n9NOnG3tARmQ/N/nOa21xpPIf9DuwHlV/wg2iT/G98voPtah+neY
 CHlLbvFH091mfZbC7hOxVpb4OhVa5VuYgutLODDt5brfvcfHfKlnUYCE7E5pdcm6wVf12cR8Sr/
 KLkz3FotjHprpMowS/nH+nl01pYe4oexr8xciTkpDfDO0Wy5gkKlbBIUUdhZHgyAz19OwFVdTjd
 /0+M94NYKDrpJVu7JyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX4FvkZM1MFaRu
 /A1jOWz7Xt4WDUZYGxZ4Sl8y4gS5K+W3pt4FC0+ayI09FT4lAR0Y5dPII8OVpxCtRO2zR8N9X6J
 7OX0jajDYkvzquntKOy8kPIesZYXIoQ=
X-Proofpoint-GUID: FZ208XmUByRv0BTxcJ_HnSQjn4B8lgQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095438_996511_F13EC5DA 
X-CRM114-Status: GOOD (  17.66  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIFJJU0MtViBJU0EgZGVmaW5lcyBTdXBtIGFzCgogICJBbiBleHRlbnNpb24gdGhhdCBpbmRp
Y2F0ZXMgdGhhdCB0aGVyZSBpcyBwb2ludGVyLW1hc2tpbmcgc3VwcG9ydAogIGF2YWlsYWJsZSBp
biB1c2VyIG1vZGUsIHdpdGggc29tZSBmYWNpbGl0eSBwcm92aWRlZCBpbiB0aGUgYXBwbGljYXRp
b24KICBleGVjdXRpb24gZW52aXJvbm1lbnQgdG8gY29udHJvbCBwb2ludGVyIG1hc2tpbmcuIgoK
T3VyIGZhY2lsaXR5LCBQUl97U0VULEdFVH1fVEFHR0VEX0FERFJfQ1RSTCwgYWx3YXlzIHJldHVy
bnMgLUVJTlZBTAp1bmxlc3MgQ09ORklHX1JJU0NWX0lTQV9TVVBNIGlzIGVuYWJsZWQsIFN1cG0g
aXMgcHJlc2VudCBvbiBhbGwgaGFydHMsCmFuZCB0aGUgdXNlci1tb2RlIGlzIHJ1bm5pbmcgaW4g
NjQtYml0IG1vZGUuCgpXaGlsZSB3ZSB0ZWNobmljYWxseSBjb3VsZCBhZHZlcnRpc2UgU3VwbSBl
dmVuIHdoZW4gaXQgb25seSBzdXBwb3J0cwpQTUxFTj0wLCBpdCBzZWVtcyBhIGJpdCBtb3JlIHVz
ZWZ1bCB0byByZXBvcnQgU3VwbSBvbmx5IGluIGNhc2VzIHdoZXJlCnRoZSB1c2Vyc3BhY2UgY2Fu
IGNvbmZpZ3VyZSBub24temVybyBwb2ludGVyIG1hc2tpbmcuCkEgbWlub3IgZG93bnNpZGUgb2Yg
dGhpcyBhcHByb2FjaCBpcyB0aGF0IHdlJ2xsIG5lZWQgdG8gdXBkYXRlIHRoZSBTdXBtCmRldGVj
dGlvbiBsaW5lIHdoZW4gbW9yZSBwb2ludGVyLW1hc2tpbmcgbW9kZXMgZ2V0IGFkZGVkLgoKaHdw
cm9iZSBjdXJyZW50bHkgcmVwb3J0cyBTdXBtIGZyb20gdGhlIHBlci1oYXJ0IElTQSBiaXRtYXBz
IGFsb25lLCBzbwppdCBjYW4gYWR2ZXJ0aXNlIFN1cG0gd2hlbiB0aGUgZmFjaWxpdHkgYWx3YXlz
IHJldHVybnMgLUVJTlZBTC4KUmVwb3J0IHNsaWdodGx5IG1vcmUgcHJlY2lzZSBlbnZpcm9ubWVu
dCB0byB1c2VyLW1vZGUuCgpIaWRpbmcgU3VwbSBpbiBjb21wYXQgdGFza3Mgd291bGQgYWRkIGNv
bXBsZXhpdHkgdGhhdCBkb2Vzbid0IHNlZW0KanVzdGlmaWVkIGFzIDMyLWJpdCBjb2RlIGhhcyBu
byByZWFzb24gdG8gbG9vayBhdCBTdXBtIGFueXdheS4KUmVwb3J0aW5nIGJhc2VkIG9uIHRoZSBn
bG9iYWwgc3lzY3RsIHRvZ2dsZSBpc24ndCBkb25lIGVpdGhlci4KCkZpeGVzOiAzYzJlMGFmZjdi
NGYgKCJyaXNjdjogaHdwcm9iZTogRXhwb3J0IHRoZSBTdXBtIElTQSBleHRlbnNpb24iKQpTaWdu
ZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29t
PgotLS0KdjI6CiogVXNlZCBwbWxlbiBoZWxwZXJzIGZyb20gdjcuNC1yYzEgW0d1b2RvbmddCiog
VXBkYXRlZCBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSByZWFzb25pbmcKLS0tCiBhcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5k
ZXggYTlhYTFlMTkzODQwLi4yMTczOGUyNTM5YTggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpA
QCAtMTAxLDYgKzEwMSw5IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJp
c2N2X2h3cHJvYmUgKnBhaXIsCiAJaWYgKGlzX3VzZXJfbHBhZF9lbmFibGVkKCkpCiAJCXBhaXIt
PnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0ZJTFA7CiAKKwlpZiAocmlzY3ZfaGF2ZV91
c2VyX3BtbGVuKDcpIHx8IHJpc2N2X2hhdmVfdXNlcl9wbWxlbigxNikpCisJCXBhaXItPnZhbHVl
IHw9IFJJU0NWX0hXUFJPQkVfRVhUX1NVUE07CisKIAkvKgogCSAqIExvb3AgdGhyb3VnaCBhbmQg
cmVjb3JkIGV4dGVuc2lvbnMgdGhhdCAxKSBhbnlvbmUgaGFzLCBhbmQgMikgYW55b25lCiAJICog
ZG9lc24ndCBoYXZlLgpAQCAtMTgzLDkgKzE4Niw2IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNh
X2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRfS0VZKGlzYWluZm8tPmlz
YSwgWkZILCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WkZITUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCX0KLQotCQlpZiAoSVNfRU5BQkxFRChD
T05GSUdfUklTQ1ZfSVNBX1NVUE0pKQotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFNVUE0sIHBh
aXItPnZhbHVlLCBtaXNzaW5nKTsKIAl9CiAKIAkvKiBOb3cgdHVybiBvZmYgcmVwb3J0aW5nIGZl
YXR1cmVzIGlmIGFueSBDUFUgaXMgbWlzc2luZyBpdC4gKi8KLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
