Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAA60A5BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ID932JIL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3SAuxuV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FgZEz/IN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZMJt0LZpEx4eqZ+8YmjikldSrOWaOzM/eKWVatw8uAc=; b=ID932JIL6tFviaPmadCJIrEv2r
	nkSqmGPp5F7J7IVORcuD0w7zOXGbE0FFk4ruzaNKv27T6TmnxotQvZeNymj7tF8JMI/9acb8eOXjW
	eaANjFbcLtxOHTc5dDJNJ5qv8Cd/ctB18gYh4Q8/17zTsH19zuCE/EIK/HLNt0vnHwrXIyiI2Nh4E
	Rs9fZKOtvWnnZhVHcNWgafokmLTBUUjKxtyykyo4KZXQ6jzueP2xJ5oy0vhMKi9xQiuy/qoHNceLp
	KJY9oFXU1zrKjr9lKJZL4V82Nmbaq8FD7V6E6ObC33dHOe6I3oT4rkWOS4WmBg8ArZ/AkD4uvxXde
	Mq+Em7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3H-00000004jBF-0wFs;
	Tue, 10 Nov 2026 17:54:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3F-00000004jAc-0xSL
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF056s141501
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=; b=Z3SAuxuVUo3G1zXw
	gDLB43nYMnW6T2ad+/M50cdCeCVwHbEmywRSsguxUKvQNACz72gnxTd5E7NPXtGs
	RBAVKDEBC0444+eCf7DKA99gYKxr84BpjRCze5JUkT0BbTfxIDJDCgNRfY3GBaWB
	keAJ0j67AY3CfrLtj3uqjYnj+9bon4YOGY/x4UOTszYr+njUU7tEIdoGztBwCbGx
	hMYN0xiKNvd28IdjADHBWp3/NmjHAPvYLMD9uJayUUA5RupMkHkjRMW6rsJDjp64
	2lsN5rr+cEWWHDshiGok0J7vZzvwvGuvh2PcPmNSTXbMwp75OaPRMdo51mEKEDia
	ivdhiw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4q06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9986f6528fdso1827396241.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333271; x=1794938071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=;
        b=FgZEz/INDceV9Cft9sxtal8DWgJDKpFE88vVrVAee8+/IeTu8rZr6OS8itiO4B+pkS
         bNuDxnK712hE87Zs5iR7U3jtE4Py3gfzjoZj2D/l/sIrVIOX5v21Z81y6ZCJITcwy0/Q
         A1EKIUEBHnQZKg8cCD3NUH7XdPyAiIlt7QR9sDxBDYFJN+Ij+NpbZjPxtZoeqAMmcVKc
         7jV6w8UtkH3O0s9q3oASK/BWFibieuUwhvbbts2DlBmHZ/kPwtp5Toi3j0ibeqNum+V5
         fh0+TGXySgVaNQdeD/NjBpHBlhWZoqcLuhGDRv9x6T/2ZvUDYLpPnAw4jlebivyWl5f+
         FHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333271; x=1794938071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=;
        b=duvUeV1EY12NtVS6KmGxiU1TnSylD3DnG9Yy45RU4hW6JUapyOJD5mU8W2gN1hpLAl
         GPYHmpWRWePeTgRlztls0ylkNYxYVYL/IqExZiwE+3rXov6QpcIiC4ohmNIdjxP1rm12
         1E3M0fs8tdru7B2nG00XrKARqVTH8F236uJcg/Wbe30JDN/neyNmwRw5o2HpJBGK//qh
         5U50k0hatLFlSHQUqtgzDaGGnOvtj4iPL7eyV5ZLJ06+/pupdWV6KBIVtuqMdt3pb2I2
         qvUZxE11fAmb8GjOa5/N4pHyyS7W3RwKyvyjqbCLLjlv7noKsVDLRjzDKYS1HfTiQ2v2
         xfPg==
X-Gm-Message-State: APuU4Z9MzN3kInlE1Up9ISE3Gp9HLYsYqBINeUbL03z2M6WJzS5hu5IB
	ZwXbDfH8Dz/g2FtwTK2B6p3bk9qYckBVhhl8Y/UoTlMKxSwxQ+KPrv0N2YO0bG/IVIalA3IBpwv
	IgvnbdxvFoS1gx8RNjFzhsGj2ZWGVwFqNlYE/FUz0zpOjFZ63phdqagc5lvGukVJuyzhEMuUcst
	slD0A=
X-Gm-Gg: AYBFou3YZ7rZOHk+zGT2WEqqwR8tz1XDfsrNuSV6CTscQWXr9gjyoyoHjRRhGrqgKaV
	odiml6vy6jfxUCgcBP2PSEdioHBZxyMb8noH4Nl4aGK+Hgu1rAuPoGEkEfn6sfhUnigqz3RPZta
	dhIEVdfuH3qXu6xnsc1Cbbvcu2rru1g0b/3f00zfWp0QSXYRzd3Y3LfhwyJq+Ky0cG5/c94Qvjz
	un4Hfp6nzFVq4VlXkD1tX2iFnSjCu3k4zradr6CUCcHR0uEmfAMrspY3s2dgCl4sTRM68db/TVQ
	a/VjYrRuV4sk6E7qwZllPv45txP0Q/Ml2C8TbAMEjC264UkdBcnN2gYhjDqsfUVL/DGyEhD4RD8
	Hfjen+GdJV9IVUg5oVowtdcwBDcMO2mUX55JNYvRobbzwjy48f/eOYjgzxYow+kz8Dg/0TfZExm
	uJFdFZexWCcXU=
X-Received: by 2002:a05:6102:f0a:b0:7ce:645a:139e with SMTP id ada2fe7eead31-7d494e743b2mr79469137.23.1794333271425;
        Tue, 10 Nov 2026 09:54:31 -0800 (PST)
X-Received: by 2002:a05:6102:f0a:b0:7ce:645a:139e with SMTP id ada2fe7eead31-7d494e743b2mr79460137.23.1794333270917;
        Tue, 10 Nov 2026 09:54:30 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020485bcsm73494005e9.11.2026.11.10.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:30 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 1/6] riscv: hwprobe: Report FP extensions only when available
Date: Tue, 10 Nov 2026 18:50:43 +0100
Message-ID: <20261110175048.82208-2-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX/FbI+VZgF7Hr
 MjOG9Ycd4/7JKJi8W2V9cxtBjtJxV3L9mJ50C9Mim8+WfeoqauoBWvnLrdSQGyhaRznaJrIbsVq
 qsuUzva32zXvk+0yVsZdz/Xd4WYdvA6EI7Q8QMfxBa8w1Kniya6YLpEVeT/3fDGMoeqfgZSyroV
 W1SC7dHy7VtEdFnCO67luWF0GBEkQUM2jXJaKo9QL/RQ2Y0LLdNWuhyKCq74FzIzpGkSvePAPDo
 ckvCa2sZtnacpNVj/Dbkmz4OIgoM+/NEZKBu8BlElWb4fOk/NYlIYGza14UJDk22p9tameXqU/5
 xG+yBOpaSgBLNM8oAm8wPMbHe+oXovxCihe4IkuQsxbl1M7miGIt/b/Mox/112GDuECZnnEZ4ml
 sUmo1pHYUGKKkPL+Tl4a9DH+fp96pznZA3OmWkNvK8BsS+2hi34V7Q9Mhb0P7igFjzysYV/7ULy
 CnCilSIEEjCOfOaidig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXw97CS1M9qY3Q
 vfZU8SXNIjAAA70bJtfdEjyu689tcYmaF3Bo0v0J8OhSrfNumON+oJSXdAa/KHSmzqVyiPCaAmt
 Iv2JIOseeH85uiUe8rs/fMoZaHOBYC8=
X-Proofpoint-GUID: _Fd_jS1nx3WvadS2RiE64ti8nNXyxbC9
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af35a58 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=h_pWu3sd9Bhu3AQz9iUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: _Fd_jS1nx3WvadS2RiE64ti8nNXyxbC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095433_404240_63AD8FB1 
X-CRM114-Status: GOOD (  14.14  )
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

VXNlci1tb2RlIHVzZSBvZiBmbG9hdGluZy1wb2ludCBleHRlbnNpb25zIHJlcXVpcmVzIG5vbi1P
ZmYgc3N0YXR1cy5GUywKd2hpY2ggd2Ugc2V0IG9ubHkgd2hlbiBoYXNfZnB1KCkgKENPTkZJR19G
UFUgYW5kIEQgb24gYWxsIGhhcnRzKS4KVGhlIHZlY3RvciBmbG9hdGluZy1wb2ludCBleHRlbnNp
b25zIHJlcXVpcmUgbm9uLU9mZiBzc3RhdHVzLkZTIHRvbywgYnV0Cmh3cHJvYmUgZ2F0ZXMgdGhl
bSBvbmx5IG9uIGhhc192ZWN0b3IoKSAoQ09ORklHX0lTQV9WIGFuZCBadmUzMnggb24gYWxsCmhh
cnRzKS4KCkNPTkZJR19JU0FfViBkZXBlbmRzIG9uIENPTkZJR19GUFUsIGJlY2F1c2UgViBleHRl
bnNpb24gaW1wbGllcyBadmU2NGQsCmJ1dCBoYXNfdmVjdG9yKCkgb25seSByZXF1aXJlcyBadmUz
MngsIHNvIGhhc192ZWN0b3IoKSBkb2Vzbid0IGltcGx5Cmhhc19mcHUoKSwgaGVuY2Ugd2UgY2Fu
IGJvb3Qgb24gYSBtYWNoaW5lIHdoZXJlIGFsbCBoYXJ0cyBoYXZlIFp2ZTMyeCwKYnV0IG5vdCBh
bGwgaGFydHMgaGF2ZSBELgoKaHdwcm9iZSBjdXJyZW50bHkgcmVwb3J0cyB0aGUgZXh0ZW5zaW9u
cyBmcm9tIHRoZSBwZXItaGFydCBJU0EgYml0bWFwcwphbG9uZSwgc28gaXQgY2FuIGFkdmVydGlz
ZSBleHRlbnNpb25zIHRoYXQgYXJlIGFsd2F5cyBkaXNhYmxlZCBpbgp1c2VyLW1vZGUuICBSZXBv
cnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1vZGUuCgpGaXhlczogMmUyY2Y1NTgxZmNj
ICgicmlzY3Y6IGNwdWZlYXR1cmU6IGFkZCB2YWxpZGF0aW9uIGZvciB6ZmEsIHpmaCBhbmQgemZo
bWluIikKRml4ZXM6IGRlOGY4MjgyYTk2OSAoInJpc2N2OiBod3Byb2JlOiBhZGQgenZlIFZlY3Rv
ciBzdWJleHRlbnNpb25zIGludG8gaHdwcm9iZSBpbnRlcmZhY2UiKQpGaXhlczogNWRhZGRhNWU2
YTU5ICgicmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMiKQpG
aXhlczogYTQ4NjNlMDAyY2YwICgicmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBiZmxvYXQxNiBJU0Eg
ZXh0ZW5zaW9uIikKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8dGNoaXVAdGVuc3RvcnJlbnQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNv
bW0uY29tPgotLS0KdjI6CiogYWRkZWQgb25lIG1vcmUgIkZpeGVzOiIgZm9yIGJmbG9hdAoqIGhv
cGVmdWxseSBjbGFyaWZpZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGFyb3VuZCBDT05GSUdzCiogYWRk
ZWQgci1iCi0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyB8IDMxICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCBjZDdjZjI3MmU2
ZTEuLmZlYWU0MDQ2NmUyYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xNDYsMTUgKzE0
Niw4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUg
KnBhaXIsCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VkJCLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZC
QywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTMy
RiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTMy
WCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0
RCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0
RiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0
WCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJG
TUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZG
QkZXTUEsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VkZILCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZG
SE1JTiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpW
S0IsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktH
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZLTkVE
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CkBAIC0xNjMsMTQgKzE1NiwyNiBAQCBzdGF0aWMgdm9p
ZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJRVhUX0tF
WShpc2FpbmZvLT5pc2EsIFpWS1NFRCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQkJRVhUX0tF
WShpc2FpbmZvLT5pc2EsIFpWS1NILCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZ
KGlzYWluZm8tPmlzYSwgWlZLVCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOworCisJCQlpZiAoaGFz
X2ZwdSgpKSB7CisJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTMyRiwgcGFpci0+dmFsdWUs
IG1pc3NpbmcpOworCQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NEQsIHBhaXItPnZhbHVl
LCBtaXNzaW5nKTsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFNjRGLCBwYWlyLT52YWx1
ZSwgbWlzc2luZyk7CisJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJGTUlOLCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7CisJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJGV01BLCBwYWly
LT52YWx1ZSwgbWlzc2luZyk7CisJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkgsIHBhaXIt
PnZhbHVlLCBtaXNzaW5nKTsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZGSE1JTiwgcGFp
ci0+dmFsdWUsIG1pc3NpbmcpOworCQkJfQogCQl9CiAKLQkJRVhUX0tFWShpc2FpbmZvLT5pc2Es
IFpDRCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkNG
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaRkEsIHBh
aXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpGQkZNSU4sIHBh
aXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpGSCwgcGFpci0+
dmFsdWUsIG1pc3NpbmcpOwotCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkZITUlOLCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7CisJCWlmIChoYXNfZnB1KCkpIHsKKwkJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaQ0QsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCUVYVF9LRVkoaXNhaW5mby0+aXNh
LCBaQ0YsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
RkEsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaRkJG
TUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CisJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkZI
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CisJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkZITUlO
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CisJCX0KIAogCQlpZiAoSVNfRU5BQkxFRChDT05GSUdf
UklTQ1ZfSVNBX1NVUE0pKQogCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFNVUE0sIHBhaXItPnZh
bHVlLCBtaXNzaW5nKTsKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
