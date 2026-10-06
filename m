Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4936CA6004
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uYgEEGY123nBIXi7USy3JlTvzqUPweehaMielXpepHA=; b=D3Lh7yYfjrIOgz
	zIXCNmhrGngWyyhPSu7jgGzjzyhmXFXGCyn3LmHFc2UPv52HZVu/ZWk3sAEO0kGS4VL+8zKdBiDmy
	nYlFCq7J4cH5mW5GobRZ783JDn34CUFEN6mcv70wDBrjXhufO7L+8l0diRL8MMo1hm7/G5Skmx34h
	CUrlAydNOI4p/vqQgVXAnj7IPgNXXlfA+bDp+ReerpbOJWt8AljNOOHtR8MqizCitg7P3Fp+R47MJ
	ZDfIGxojw8dOnDGY9GI5cG+WniYpDy69+fY00BXQmXKwtjYcPL9uunLqkypzUOuhrDuZpgnB57fA+
	XWXmk8vYM+M94RM1V7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE000-00000000EB7-2hIN;
	Tue, 06 Oct 2026 07:54:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzzx-00000000EAU-2OWr
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eLnA418970
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GveUWsC9iQvqGwFlJAim2t
	3VXefVtrhRU2LiM/lOUsU=; b=GzhIEsYOn9ZZIl9F+jZTtAM6oNWwrH9cGssdSa
	pVvD4bY8edCpDqr9Gepxx7FHmI8UAd2w8vC+w3WtnytxQvIDrs5rojG6BA689UTf
	jpai/lqiblfp+gZxC1Co59uVGFqFJypsK7tfq9RJEofFu7ZsG7ifRj0T1b9pcJna
	iNzyZs9umHIS/rT8UO6+yz3efHuzKBKzW7UchNGKuSHZpZxvnJQR0RThcM5KAtRz
	KUKocRS2Ar+AiiDw0i/bRT4tDYMPzTmKKO1ZvrTChKq1+dNUFdcqGyu5ePKZfWY4
	WZgcQycElP6Lp3wZ9ph7SdrnIxlRyA1FrAuuKMuLMM/bdgmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg434d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so509976785a.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273244; x=1791878044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GveUWsC9iQvqGwFlJAim2t3VXefVtrhRU2LiM/lOUsU=;
        b=hy0HiRE6tHu3Vmxm6SvTk5p8UI2YfJNoTJ5av1J1vfB4fMEGyk17cl3NK1v58CV7h/
         3oMwMeCCWwV0eueVuY1qvkOSznVfb/HvNXvqtaJvfD88e4I/5V3qAgl7MFpg/0YDZVHW
         KNAKVqjUblvE4VMYhZV/s9NpptT4aUaJPzSUyZ50gpVATnNWGIJ/kNYG/4gpN8FgW1TD
         zhqErB95JuEzC13FSd3rYLimehQEAvRGQaG/kKE9i3BQFhoyq2y/BVP6J10AaFQj4ELv
         FyXp+9mqHq9CbGnrnqhAVPkDlt7mlYD0oVdf+OQGqpN6RdmvUCDkExx7k4E0mCOYWDG9
         MzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273244; x=1791878044;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GveUWsC9iQvqGwFlJAim2t3VXefVtrhRU2LiM/lOUsU=;
        b=xhwy9SUtKL2aKQw1K4oSoJViJ71wfsMOWvoCZo9PWSlKwvCHK/XjGTpq1wIQAqbALQ
         t3w+u9zjNz3iJJzt8Zr0zaf0/yUTI9qzzpIJpMKXVnyoTsc1qgDmRJwmmeVOxeASDjwU
         9UGtLCnPwlPv/x1anf5gBuYuj+n/prsjLbNFWOCItFs983iLj3uspVVVUcGxbXzib7nD
         ewUvLOCIGB+2DsTNQfCmcVyqp+05wETpuVGTBhNRIWXA8megSx9GDU/K2Bp67OMaZ2H9
         E6Yv7vG5T/4fVobiPgZxpD94cCqlkmtIeLeFpeG52omuQR7Q0cRIrctPutiev1Zpt7d7
         hglg==
X-Gm-Message-State: AFuF++kP8s+4qgrT+9IyHwNkYlN+/PJMXyWJmUU/85H5D625KpTOcPPb
	r/wIAnPzHBELDU93aCJbUoZBRmuGxSk8TUZT1EIGoDNnPe5nAZG82p4tbOaOicQp+e4GUMwy/AQ
	IrLh5puVvnmd2hAnLxb2EtUUUb4ecBsPslMfWeaOWfUjGFXJ43sbuAm2jdCKRgBjtHoPV39A2fs
	aaXzI=
X-Gm-Gg: AYBFou2LIbXyDBrCrrOo7K/aOyBHtoWqNsoxN9V4xmQ9mSoFdR4pOLvt2FYcJaeLSSq
	jU1NMhcJZ9Z5GJITEQJCKH6KxC3IJ7Gf920b5OWKSaZlfSe9CtDq4dxViozGRzJzoH7a71HxuTf
	NowfbfqkKjxYXQ5bBWc2I0ImvcFM0v7/vKO4xOhuY8EuWKE55X5ur/bCA1uJ9L8wwx9PETVd/Bn
	9fDWgQd3wu00kMjIItmQwXFtFSOom0Zjs4IhgmQJQPlk8w1fetkVARpScC8wjSDkLfKJvuBzK7S
	88x55wuGWn3Sk/blWRkC6aHbgCeeRT9A5j6rBYbBLLVtPD/ejn9zIC3VDF01i1DsqrhtbpSOqGo
	N3zkxpyyCn9CCeTYzGxOq9CV518GFdYWeOixjBQ==
X-Received: by 2002:a05:620a:4613:b0:93c:c162:125b with SMTP id af79cd13be357-93e8f4cb8f5mr108223285a.39.1791273243575;
        Tue, 06 Oct 2026 00:54:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93c:c162:125b with SMTP id af79cd13be357-93e8f4cb8f5mr108220185a.39.1791273243062;
        Tue, 06 Oct 2026 00:54:03 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm84487865e9.14.2026.10.06.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:02 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 0/6] riscv: hwprobe: do not report disabled extensions
Date: Tue,  6 Oct 2026 09:52:57 +0200
Message-ID: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: SxzSZutlAxpheh8eVJ6qMtzuRrqaro3g
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac4a91c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=t9496tuAAAAA:8 a=TFIeobte5ycoxvPPQQgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX3crtio7ywJRK
 dq1yX9EtWAHYVs9/flAygxN4KBfUwIJgG3YfwzklG0j7cpfnqF2uj0ErQohtxez9l5Mc99TOgwW
 v0+5ZPW+6CSxDw/f6CKuViYH+3oFG80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX90UI5Z959uw4
 oC6/QsJbM2uKgPMEIvogSzw+QLyY2MmPXqudbiimSV0CnZU01UEVjDvcFzzRdFyADadC/DGFcK9
 QQochtF4PZ30Bk9KeBSvQQgQotrJD/lma10XEuGo3A+amL3K+4lnGlIY0nO2T6cpc04YfdotmYj
 7Os0Qrn+N0bARvec8XQWPQNXTCd1Suoq5kosIDy4kWad4CEX7v+uy7v3flR1S1jJF8lJfwAEb16
 OzyDx9IM8wEb2T00SgOh/3rnz/IfNHydGwhxfHEdZYMyabl9NY50sr9CEn8el6WmFbtxjQqbiHr
 PLE2KUstqeYOQCDdi7SL7CdLZ6Dh+lBaF7PTunEq/neEzLwDOrULBG3kwbrA7TcINZyLtoi+LGi
 xNxsE4ZPEAxst6F60i4LEaI8BH07S/+C9tjxgZk4DeQ7BlfikDtyU0qA2AghkGEqwJ/eIUfPGBO
 9Yc9De209ZeYojjYm+Q==
X-Proofpoint-GUID: SxzSZutlAxpheh8eVJ6qMtzuRrqaro3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005405_736746_963110C6 
X-CRM114-Status: GOOD (  12.32  )
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

SSB1bmRlcnN0YW5kIGh3cHJvYmUgdG8gYmUgYW4gaW50ZXJmYWNlIHRvIHF1ZXJ5IHRoZSBmZWF0
dXJlcyBvZgp1c2VyLW1vZGUgZXhlY3V0aW9uIGVudmlyb25tZW50LgpTb21lIFJJU0MtViBleHRl
bnNpb25zIG5lZWQgdG8gYmUgZW5hYmxlZCBpbiB1c2VyLW1vZGUgdGhyb3VnaCB0aGUgdXNlCm9m
IGhpZ2hlci1tb2RlIGNvbnRyb2xzIChsaWtlIHNzdGF0dXMsIHNlbnZjZmcsIG9yIHNzdGF0ZWVu
KSwgYW5kIHdoZW4Kd2UgZm9yIHNvbWUgcmVhc29uIG5ldmVyIGVuYWJsZSB0aGUgZXh0ZW5zaW9u
cyAoZGlzYWJsZWQgaW4gY29uZmlnLCBieQpib290IHBhcmFtZXRlciwgaGV0ZXJvZ2Vub3VzIHBs
YXRmb3JtIGFsaWdubWVudCwgZXRjLiksIGh3cHJvYmUgc2hvdWxkCm5vdCByZXBvcnQgdGhhdCB0
aGUgZXh0ZW5zaW9ucyBhcmUgcHJlc2VudC4KClRoaXMgc2VyaWVzIGJyaW5ncyB0aGUgdXNlci1t
b2RlIGV4dGVuc2lvbiByZXBvcnRpbmcgaW50byBhIHN0YXRlIHRoYXQKaXMgbW9yZSBjb25zaXN0
ZW50IHdpdGggdGhlIHVzZXItbW9kZSBvYnNlcnZhYmxlIGV4dGVuc2lvbiBzZXQuCgpUaGVyZSBh
cmUgbWlub3Igb3ZlcmxhcHMgd2l0aCBBbmR5IENodWkncyBzZXJpZXMgdG8gcmVwb3J0IHRoZSBk
eW5hbWljCnN0YXRlIG9mIGhpZ2hlci1tb2RlIGNvbnRyb2xzIHRocm91Z2ggaHdwcm9iZSBbMV0u
CkFuZHkncyBzZXJpZXMgYWRkcyBhbm90aGVyIGxheWVyIHRoYXQgY2FuIHF1ZXJ5IGZlYXR1cmVz
IHdob3NlCmF2YWlsYWJpbGl0eSBkZXBlbmRzIG9uIHJ1bnRpbWUgdmFyaWFibGVzLCB3aGlsZSB0
aGlzIHNlcmllcyBpcyBjb3ZlcmluZwpjb25zdHJhaW50cyB0aGF0IHRoZSB1c2VyLW1vZGUgY2Fu
bm90IGluZmx1ZW5jZS4KClRoaXMgc2VyaWVzIGRvZXNuJ3QgdG91Y2ggWmljbnRyIGFuZCBaaWhw
bSBzaW5jZSB0aG9zZSB3aWxsIHJlcXVpcmUgbW9yZQpkaXNjdXNzaW9uLiAgWmljbnRyIGNvdWxk
IGJlIHJlcG9ydGVkIHRocm91Z2ggQW5keSdzIG1lY2hhbmlzbSBiYXNlZCBvbgp0aGUgc3lzY3Rs
IHN0YXR1cyBhbmQgWmlocG0gbWlnaHQgYmUgc29tZWhvdyByZWludGVycHJldGVkIGZvciBwZXJm
CmF2YWlsYWJpbGl0eSBvciBqdXN0IGlnbm9yZWQuCgpBcHBsaWVzIHRvIHJpc2N2L2Zvci1uZXh0
IGp1c3QgYXMgd2VsbCBhcyB0byB2Ny4zLXJjNi4KCi0tLQoxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDI2MDcyNTAwMTYxNC4yNTc4NjE3LTEtdGNoaXVAdGVuc3RvcnJl
bnQuY29tLwoKClJhZGltIEtyxI1tw6HFmSAoNik6CiAgcmlzY3Y6IGh3cHJvYmU6IFJlcG9ydCBG
UCBleHRlbnNpb25zIG9ubHkgd2hlbiBhdmFpbGFibGUKICByaXNjdjogaHdwcm9iZTogUmVwb3J0
IFppY2JvbSBhbmQgWmljYm96IG9ubHkgd2hlbiBhdmFpbGFibGUKICByaXNjdjogaHdwcm9iZTog
UmVwb3J0IFppY2ZpbHAgYW5kIFppY2Zpc3Mgb25seSB3aGVuIGF2YWlsYWJsZQogIHJpc2N2OiBo
d3Byb2JlOiBSZXBvcnQgU3VwbSBvbmx5IHdoZW4gYXZhaWxhYmxlCiAgcmlzY3Y6IGh3cHJvYmU6
IFJlcG9ydCBYVGhlYWRWZWN0b3Igb25seSB3aGVuIGF2YWlsYWJsZQogIHJpc2N2OiBod3Byb2Jl
OiBSZXBvcnQgU2lGaXZlIHZlY3RvciBleHRlbnNpb25zIG9ubHkgd2hlbiBhdmFpbGFibGUKCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCAgICAgICAgICAgICAgfCAgOSArKy0KIGFy
Y2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8IDU1ICsrKysrKysr
KysrKy0tLS0tLS0KIC4uLi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3cHJvYmUu
YyB8IDE0ICsrKy0tCiAuLi4va2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUu
YyAgfCAgNSArLQogNCBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlv
bnMoLSkKCi0tIAoyLjU1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
