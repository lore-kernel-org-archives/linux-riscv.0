Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F20606B402
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pEvAw/Ox;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPLpDJgn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFZ6z1jL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pfGvFb5p6pPi5vXIeXcxiQ573kl9yusilHWt3meDDGU=; b=pEvAw/OxeokAKFw17jdBKEfsg1
	rH+YYdvqsh1hnHgvEdst+XiWuz804vGn+XozNKQScmtl3YX5lgnPVn42Uya3rZcWRVLqTlwYpH5sI
	/6uH5zFcwYXKiTVC7g021i04c8WKqWqvby69W8wo6UK5m5kEt6yaPZRy6mfDrWExnoHzs7urhnuNn
	VTWWAMbyrXk75XTtbJdJ7Y2a1zz7NOzVRZjjVU58sz0irXLiO7XbTRhoLi0FtNbeqpkHK+0aZcnjn
	wf26jpOZHS1T2KOlXnS2A3LCW/i+RCgfGk7NS4ykAZ4Fcs5pmcRDLFkM6lbU+Pjr5QmNSguU/MrwC
	eAb2Ky0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3J-00000004jCO-1WUU;
	Tue, 10 Nov 2026 17:54:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3H-00000004jB0-06ts
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF01ca484408
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=; b=kPLpDJgnRB/CQQhh
	nVJhC7YmRMlrwFSY4zE5PlkPuPFkWe7lzv9OnMNyUOa04wohvDLY6JoOu9ZAfedd
	vKZIVYUuB2KqqpMkT7OG6U9vFPE+XpMmg61kjqtpE3CpABi2NmNGT/OkOnadzM+7
	TO47KiK8A2P57JXjQ3FIxzeSI0j++luvTyrNeccsUC0SnG4eX7eSUz1VAyeMhjzN
	d2dEQVKikx5j6MksiOVULaV1PPuTvy+CIflXwxpvp1oz0/nnV0RebL4Mkj6ZNNlY
	sKyO+ARgkahnwDAS/t2r/iNfFeVROiB0qN3xwAfFD6O0b2IN/aybrI6gJvmI5T31
	xs/jpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwj33u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so534950385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333273; x=1794938073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=;
        b=PFZ6z1jLcl6Zey9hDKR7eK7CuNd/4TzJ4X2lczP+ARdlrT9hs7Zg81gzzwf3Hk/Rg7
         ys9DMwQ9xIop0Qy/UwDI9Etp1JDCAEbWGSpU2WRFIkNMdL3+cjCBOZK3MhSY20Y3ubcS
         FkdDialnDJLUHeVYtTNDNqNNSGMrj/BB1VUZ5wU8/CAHPTYTR+YQjxOrdE5H9lAU0ih6
         NajrD3yYx0QUUbBcLl+geA/5Wpr76E5m/l9b6m0zdcIs1ey1n2nsSuZ5UA0viJoYZq6c
         A8qSf3svZRyXo1ymGa9sEIeuyfhCk5t1uwuOxRor5kGl/m2YaXFKe2aFxX8a+xA9D2zi
         QqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333273; x=1794938073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=;
        b=TBAy3etSV+sO4Jb3DYFHMrHFcFDyUhQjUhnP0vX51YJ7XpgjJuh9pQPnQ6RfwsP6ac
         suR/mnzRtbgoLQLwBT/TSBYb/JwWyTN5cJFAfPe4qDhqiFdtraTppHTVWpO9SEL7vf96
         QzS2L2+jr47IJm0XGjZGSA1FqhIM/rzZjt2MzxQTc6Ml84fJGBFIq+apo+C4xs7yZShn
         y4e1vicdOpJm74upzuFf1DfvjjGYRc8kygBvpt4U+KQp6HXHJDzqFEjg2omf4e4aZvwi
         PkYxUbdk5ZlsLzq4n9qargumQS4kabCz2J75CMCdaj7N1H2LMYF900Nkv9EU3a5m90cW
         1Iwg==
X-Gm-Message-State: APuU4Z+9GY86ctDYPKsGY5EBagcQK3ZtVvQ8Nosz2rUDJ7W1TFbQmnKr
	NpO+bESniP2NpwypX69QO/yxr4rn+NZIp5DB7OK2sdhU0thmAei15VBzT4iG35bKwvYpnriUFZ0
	5ShcmlikvfueNNQJqwEA5r59Bl3lNyuVS6eFXvLT7GdKfKzhKIuWCIPKMYmKTHNdlNalabMdFj+
	bFk0U=
X-Gm-Gg: AYBFou0zTjpDJSIyi/3SKXC5WRkj58DQ0xzOJ3NzYs7J+jQLbNKKxntCdcjYv2/hn4K
	NVDggjFeyIW4cvsX6cz2OgShmqWg79eufTagOZUtJSYIfuXSKVTMZ3NEHdY5IMSiye5xT47jIeq
	30QxongF5FS9HfcE3mNiaH3uNxWZ71vGnNL0C58BRCG/Z452FkCwaOfOiEJqj6i42ssXgl6rz+o
	biH5W/bxpCg8rD92/v/GGq9CxhSSb5E+4zZ+FmuxipRV+xzopC1ffNuZOsHsewliRzG2xSC7p/w
	8cTmJofxOVOJor6joZUC+at3+QTYHgstW35UIeIl6VAeLgaaNvPYofu4GTkL0efl89xwqqlI/iZ
	OFPOpzhCBTGmR7F+SqdTMRMs9nQEB2TVJ13o0+z6XsnyvzNZM4L1T0eCXHS2DTFPko801S9hLSI
	J436claM+WrU0=
X-Received: by 2002:a05:620a:1a28:b0:93e:9792:fd47 with SMTP id af79cd13be357-9479f1c0455mr543171385a.4.1794333273489;
        Tue, 10 Nov 2026 09:54:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:93e:9792:fd47 with SMTP id af79cd13be357-9479f1c0455mr543166985a.4.1794333272867;
        Tue, 10 Nov 2026 09:54:32 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6540280f8f.50.2026.11.10.09.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:32 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v2 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
Date: Tue, 10 Nov 2026 18:50:44 +0100
Message-ID: <20261110175048.82208-3-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: PXaGuVgN3bigKX1zWHT17QG1ohxN4tYw
X-Proofpoint-ORIG-GUID: PXaGuVgN3bigKX1zWHT17QG1ohxN4tYw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXwi2+EgYBcYJ9
 6kf/cdqbau0RYVuITiSbeoIZymm67Xc5R/17s6igQxPuwphEptzSgEpTpWeDjJLvOtYX0boo7U7
 Tb7m2G6TD6wE3upJWJlKrv2s6ezxn+E=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af35a5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=o7KgkvQ512dmKa9T_xgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXxEzk+wDHP6ip
 Uv0SeN3pzpQx11L8heInWzcEcpT2EJpfwc4BTIA2DEr4N5ghG1GP2cjI7wOxEs9x+JTg8lXCgan
 HALboux/bjLqqVCNcdO4RUFFcXh/LMfZDlqClk5YDzZ+TdyXsR0oKTUCJDKr5X0pKzrWkq9cgdZ
 TNOnOFMj9I2dx8pOATcWPVFF22yEDg3wzGqmOj7RbdT/S5V2Ib/wSj6ZxPloFNx1oIc4MrFHDcN
 xzbr2GoqwibibcSHklDzft0m1t/bJopycfyanNrelNX6VygqA6zaGfNAKbvNS4lrYuClBf8BsX2
 Ue9CBOSeSAwHhyJbxRJKDkGzr1lsx5+7IOI/OPMs8OFOL35K6Xqyf11nhZgCiixpNATFV1xRaqQ
 HNPQSjw49SWunAjn3sNu8nqbcF23CW++3HFDhpxp0yNHdBKqKVgvoXJpWm4yEVrGTSlPJBo6Tut
 QooSySmzdd7ABNkPUxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095435_066714_B9165929 
X-CRM114-Status: GOOD (  13.66  )
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

VXNlci1tb2RlIHVzZSBvZiBaaWNib20gYW5kIFppY2JveiByZXF1aXJlcyBzZW52Y2ZnLkNCQ0ZF
IGFuZApzZW52Y2ZnLkNCWkUsIHJlc3BlY3RpdmVseSwgd2hpY2ggd2Ugc2V0IG9ubHkgd2hlbiBh
bGwgaGFydHMgaGF2ZSB0aGUKZXh0ZW5zaW9uLgoKaHdwcm9iZSBjdXJyZW50bHkgcmVwb3J0cyB0
aGUgZXh0ZW5zaW9ucyBmcm9tIHRoZSBwZXItaGFydCBJU0EgYml0bWFwcwphbG9uZSwgc28gaXQg
Y2FuIGFkdmVydGlzZSBleHRlbnNpb25zIHRoYXQgYXJlIGFsd2F5cyBkaXNhYmxlZCBpbgp1c2Vy
LW1vZGUuICBSZXBvcnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1vZGUuCgpGaXhlczog
MWI1Nzc0N2U5NzhmICgicmlzY3Y6IEVuYWJsZSBjYm8uemVybyBvbmx5IHdoZW4gYWxsIGhhcnRz
IHN1cHBvcnQgWmljYm96IikKRml4ZXM6IGViMTAwMzk3MDk0MCAoIlJJU0MtVjogaHdwcm9iZTog
RXhwb3NlIFppY2JvbSBleHRlbnNpb24gYW5kIGl0cyBibG9jayBzaXplIikKUmV2aWV3ZWQtYnk6
IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgpSZXZpZXdlZC1i
eTogQW5keSBDaGl1IDx0Y2hpdUB0ZW5zdG9ycmVudC5jb20+ClJldmlld2VkLWJ5OiBHdW9kb25n
IFh1IDxndW9kb25nLnh1QG9zcy5xdWFsY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IFJhZGltIEty
xI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+Ci0tLQp2MjoKKiBzbGlnaHRs
eSByZXdvcmRlZCBjb21taXQgbWVzc2FnZQoqIGFkZGVkIHItYgotLS0KIGFyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGZlYWU0
MDQ2NmUyYi4uNzNkNWUyNTY3N2E1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTkxLDYg
KzkxLDEyIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJv
YmUgKnBhaXIsCiAJaWYgKGhhc192ZWN0b3IoKSAmJiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShOVUxMLCBWKSkKIAkJcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfVjsKIAor
CWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaSUNCT00pKQorCQlwYWly
LT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT007CisKKwlpZiAocmlzY3ZfaXNhX2V4
dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWklDQk9aKSkKKwkJcGFpci0+dmFsdWUgfD0gUklTQ1Zf
SFdQUk9CRV9FWFRfWklDQk9aOworCiAJLyoKIAkgKiBMb29wIHRocm91Z2ggYW5kIHJlY29yZCBl
eHRlbnNpb25zIHRoYXQgMSkgYW55b25lIGhhcywgYW5kIDIpIGFueW9uZQogCSAqIGRvZXNuJ3Qg
aGF2ZS4KQEAgLTEyMCw5ICsxMjYsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0
cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkNCLCBw
YWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaQ0xTRCwgcGFp
ci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkNNT1AsIHBhaXIt
PnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ0JPTSwgcGFpci0+
dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDQk9QLCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7Ci0JCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaSUNCT1osIHBhaXItPnZh
bHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ0ZJTFAsIHBhaXItPnZh
bHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ05UUiwgcGFpci0+dmFs
dWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDT05ELCBwYWlyLT52YWx1
ZSwgbWlzc2luZyk7Ci0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
