Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79443606B437
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GV4G4atP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APFPFUzO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1LMsYr+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c0yU/OqK2G/XgqR2hYZvnKGEXzAi/gazKfr+poeDAgY=; b=GV4G4atPNg9RZgopyVrMkD3Z5e
	Vr+/OKiGDpS49ocD7yrJnGmgEJJ2jynBI31yV+CNXBEFAWmcsFCQbIeqmXB5xyGDKnfcBPDmV5qgA
	hIGgfYOmM3Ls0g/nbF/yPTPamwSGWUL9U/+f7SV2Lq8ovq3KnW3lEeZMstSZMuKoTg99hcIiXueu5
	gJHmuwA4zeMRwsqlXNSyrkaLMdEYvH+8a08dQ/uJFZnuZDLMPQ3XR6LKXXVNPHlNPYqnAyboYlTg5
	4oFH/D5Zk04165zKXr+AvfexLrgc1Of9CjANRlLfwswdeU59hLcyRfK4Vqi3FxRo5S9rYSkE8J+n6
	cVuEAnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3G-00000004jAr-0STd;
	Tue, 10 Nov 2026 17:54:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3D-00000004jAF-0F2r
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0C7U3713472
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t2nLJymu4EkFJDulA4/AXf
	+g10MhbzHY/rhNcJujC+0=; b=APFPFUzOwb2uLowjiToz1MIzBLb5XfiVxms36p
	gNjRMif7LCeG8iYyrqfULSu6yPQtbcoMAU9i0YsxTr0+uGTXYEe+lh9RAtuPKyNx
	kb8Ogm/oIEv2FYSrztX/QgkwFGjp9Anu65acbRkRsHTNx/dhN7aVUDkKtXU7+Vaz
	LHIJDUPe4raS2sKLdE4ZQdIpmzYazYAWUixCdF16E6OS6qtXB+bcolI2yach6D5f
	KAxglQyTmHySzasdid3VHCgKYTKn79wSb2hbWOtc/uc+dyZF8Y37NYuCoXq9F0pa
	7AASF5W/ZzzYVs6IN43nItGZ0FRetSa5qmtAXZKMoch5xrrQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdayax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b92772710so1740821241.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333269; x=1794938069; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2nLJymu4EkFJDulA4/AXf+g10MhbzHY/rhNcJujC+0=;
        b=j1LMsYr+qmME77T1Q88WkNiYKsG8whNqP4jJ9W9R8xYhF8QL8OPM4LHJ4CEe2S/s1x
         K7CIrqi3LA4UYzAsxYQQZxNkxMtemE1EJgGnwL65j/mUAlhB/AANn3PT0MSUBYyfbRYc
         gNvDA47ogSc5Un42g1pskjMXIMy9pFpIAQ3U12LJQ8r4iabFcWCnlfPLbZ9/EBQBRmN3
         e6ofW0P6OkmDz23/pIla8h8g56RDljzZiyZDOQ52Cztq2bHxMXnUgy4nfckX3SD6kMis
         e4d4yzje8kzdHKIeYyp2bsyvn1DpSAxYBXhKvIia7U+eLIvXM0/FFbLqI48BULxIEdXu
         is3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333269; x=1794938069;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2nLJymu4EkFJDulA4/AXf+g10MhbzHY/rhNcJujC+0=;
        b=d5Y1BmIW7szSyqrmYiOE/QRAYjAw1b+QIAYHtSWgNlBNomGMAQ3eHtB8sNfOFBZvKR
         2jUZhQAzyCxk54nAJzg7pllInnbL/hLB1G/5dq2n6QUvFmvMnvhoYc0fgaZNAQy9ccH5
         qEMB5hUSBHrvfF8oKoSmDI5tHGOij4av1gbRAjjnsdnS4fsjJlYtv0tl50lZ+K8hqYIq
         sBrtVnmoXw8qvjGsJYIdLlUY+wjtO0M6bWX7GjmS1tHsUjoWe2xswY9NqV+VwUVsnHnS
         KKS5yf1vh5ci9QRISQuIyhx9a4vkNzz4KWcmveh3bsaKL3QWXDcZVLLNelUVTFDZ+fab
         hbdw==
X-Gm-Message-State: APuU4Z+XRK35zk1LBaWRQbE9JQbVcNMgEi8Yket0SsSKnj/jn0ojxRA8
	MIVL3zm9Qlgiyb50vftzSsK9IwtbRJpiSBvkl8xXI4yOTcrK2eBex5oeBHI+XFP/910Sgc03wF8
	jct7thhaXe9zdmcLDIZeg+XJuGFggYJmul0MaT1jpDBIcMxyvPA4EyQzFwJrTPFL+mxRVDNYEF9
	ES3N8=
X-Gm-Gg: AYBFou0kedcIiGyppFhARd6JTsgRVeYh8nolnwK+mF2LQUAkYUmAevap1+sRsX3WW/t
	fIaJmiRR5YUCSeMH+R1LUhmz0rilnzqWk2/LspOLyfG6lEeazPN3pGpwP8PFILouXcU80bix5KQ
	bdTzOTaQnRNSNl0vx87DQk1s8ostWCpvYmcQqjw43UPzpwAEKMX+/CByYw27RxZdBSbjNyi3yZF
	wdYjWfhDKFGghw5dEQ5QffrPxeZevSL8A7ihwW18Z3HgC1v62b2heru0TWz6pmJhsCG67jk1Wk2
	JmvSidE15H6lu1kH4zzgwDA2qVSjHotCfhn1/kv+6j3FUST06fIgwhkl4pbZqPRPl9rdEBM3gDF
	qyt123BM+iGhTl8KTiO4PsvWiuRHXX+3FBuEQk3sZbz+A8d2I8cYN9LZwUgXNDvDbOY8oij5wd0
	8Y+CdDWqI6NTo=
X-Received: by 2002:a05:6102:41a0:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d301bac900mr1524366137.11.1794333269172;
        Tue, 10 Nov 2026 09:54:29 -0800 (PST)
X-Received: by 2002:a05:6102:41a0:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d301bac900mr1524355137.11.1794333268703;
        Tue, 10 Nov 2026 09:54:28 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm79712705e9.2.2026.11.10.09.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:27 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 0/6] riscv: hwprobe: do not report disabled extensions
Date: Tue, 10 Nov 2026 18:50:42 +0100
Message-ID: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: HcpHX8sD73hHMFnFQeGMYo5yF4Aon_n-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX1rMpDTEnWuAr
 Ad1ieE0xUDWmg9uMjn2nsH+XTqhCo6+QL+RZ2542CpRZrHLP02TGNUjNMvunKho/A8pedcz1qmo
 I+SyL3K3CDnlWna8F5itaDeOU/9oAak=
X-Proofpoint-ORIG-GUID: HcpHX8sD73hHMFnFQeGMYo5yF4Aon_n-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXyR5OPBXa7YEn
 8DSreUT0NxpJCO7P7iAUrVE1lrD5AgBwxEBVq48t7+o8fYxD9ZZkoD974ay4p2JZudzk0vz8/ty
 wiWrdtbewRNGhPz149TS8mBC/+f4xxo7hr6VsMzPX11/gwSECyzZ0v3gRhMat70YBdi/eTQ2wVD
 6v/ZAQSvwoNF9gBloa0RvKOjjO4rjh/CnCez/F0/BBbTMSCedtWZCw9uGufRC4qM4EMIvz/zlUH
 CsTStXE3IHuwACpLxhHotE/MyNG1EllUnFxExlQmNiiJWtKxrNgW4dY1aRktNxAnllLQ5gx/8+9
 qVuLahoSxjO+gq1AGNgri+bDFE6759dzsBzUVHM7EVpUiuy+d5GkgcbPpd5reEDysZhV2EVRRCI
 gs0pmfenq0PX7ZLGpWTl1QRlnAyDyEmhqHK13MhcY5bc8jKP01B8LdYaLaTArhwRwAokq7razVL
 qIAiwEG/DBLcf5taDhA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af35a55 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TFIeobte5ycoxvPPQQgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095431_208504_CAB855D0 
X-CRM114-Status: GOOD (  13.06  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpod3Byb2JlIGN1cnJlbnRseSBsb29rcyBhdCB0aGUgaGFydCdzIElTQSB3aGVuIGl0
IHJlcG9ydHMgUklTQy1WCmV4dGVuc2lvbnMsIGJ1dCBzb21lIG9mIHRoZXNlIGV4dGVuc2lvbnMg
bWlnaHQgYmUgcHJlc2VudCBpbiBoYXJ0J3MgSVNBLAp5ZXQgc3RpbGwgZGlzYWJsZWQgb24gdGhh
dCBoYXJ0LgpUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUgc2l0dWF0aW9uIGJ5IG9ubHkgcmVwb3J0
aW5nIGV4dGVuc2lvbnMgdGhhdCB0aGUKaHdwcm9iZSBjYWxsZXIgY2FuIGFjdHVhbGx5IHVzZSBv
biBhbGwgcXVlcmllZCBoYXJ0cy4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI2MTAwNjA3NTMwMy4yMDUyMTYtMS1yYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNv
bS8KdjI6CiAqIFs0LzZdIFVzZWQgcG1sZW4gaGVscGVycyBmcm9tIHY3LjQtcmMxIFtHdW9kb25n
XQogKiAoaG9wZWZ1bGx5KSBpbXByb3ZlZCBjb21taXQgbWVzc2FnZXMKICogci1iCgpUaGUgc2Vy
aWVzIGNoYW5nZWQgbWFpbmx5IGluIHRoZSBjb21taXQgbWVzc2FnZXMuCkEgc21hbGwgc2VtYW50
aWMgY2hhbmdlIGluIFs0LzZdIG1ha2VzIHVzIG9ubHkgcmVwb3J0IFN1cG0gd2hlbgp1c2Vyc3Bh
Y2UgY2FuIGNob29zZSBub24temVybyBQTUxFTi4KCkJhc2VkIG9uIHY3LjQtcmMxIGFuZCBldmVu
IHRocm91Z2ggdGhlcmUgYXJlIGEgbG90IG9mIEZpeGVzOiB0YWdzLCB0aGVyZQppc24ndCBhbnkg
cnVzaCB0byBnZXQgdGhpcyBpbnRvIDcuNCwgc2luY2UgdGhlIHByb2JsZW1zIGNhbiBvbmx5IGFw
cGVhcgppbiBhd2t3YXJkL2hldGVyb2dlbm91cyBwbGF0Zm9ybXMuCgoKUmFkaW0gS3LEjW3DocWZ
ICg2KToKICByaXNjdjogaHdwcm9iZTogUmVwb3J0IEZQIGV4dGVuc2lvbnMgb25seSB3aGVuIGF2
YWlsYWJsZQogIHJpc2N2OiBod3Byb2JlOiBSZXBvcnQgWmljYm9tIGFuZCBaaWNib3ogb25seSB3
aGVuIGF2YWlsYWJsZQogIHJpc2N2OiBod3Byb2JlOiBSZXBvcnQgWmljZmlscCBhbmQgWmljZmlz
cyBvbmx5IHdoZW4gYXZhaWxhYmxlCiAgcmlzY3Y6IGh3cHJvYmU6IFJlcG9ydCBTdXBtIG9ubHkg
d2hlbiBhdmFpbGFibGUKICByaXNjdjogaHdwcm9iZTogUmVwb3J0IFhUaGVhZFZlY3RvciBvbmx5
IHdoZW4gYXZhaWxhYmxlCiAgcmlzY3Y6IGh3cHJvYmU6IFJlcG9ydCBTaUZpdmUgdmVjdG9yIGV4
dGVuc2lvbnMgb25seSB3aGVuIGF2YWlsYWJsZQoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNl
cmNmaS5oICAgICAgICAgICAgICB8ICA5ICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKy0tLS0tLS0KIC4uLi9rZXJuZWwv
dmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3cHJvYmUuYyB8IDE0ICsrKy0tCiAuLi4va2VybmVs
L3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYyAgfCAgNSArLQogNCBmaWxlcyBjaGFu
Z2VkLCA1NCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKCi0tIAoyLjU1LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
