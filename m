Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B1606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pMhoO8o4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIt53Uqc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZkHRtwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qQXFfaKL1Nnl03nd8a9RUDxfxnAH1tbY6/jzOxRJixs=; b=pMhoO8o4zZU9f/eiM8XQwrZEFE
	NWMQ0SQL62tsLvTAMS/u0J9KDhdg5I5klJDjV4KW10Rz8+DeLDd+AlZO1UhLTPsr0OmH2F+mHd0AS
	1Tp91ACAhZ6tOWBgdwrWhaYe+PdszDodVJa7PO40M9Fuca8i04y6wBmDbomwpuj+5wRQGQ1kzFuuA
	g0fctBgXh4H7M3Dsnxh0WlODyRjXTYys6vpBlezZOPnbTSnPDIaVezYnsmg6rG4nWG4sv15FUGtNh
	jdeIHYsALbXLNK5QumXHxWTkFct/fMdkdcSNxzkfNeGjq8olFMSIXqK5vyNyulsfncLDZa9b4Gu2G
	dnFKDTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRqn-0000000C7CV-1Vu8;
	Thu, 26 Nov 2026 05:16:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRqk-0000000C7Bo-1iPb
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 05:16:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Is61157417
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 05:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=; b=OIt53Uqc1f+vMeFJ
	KhHrCNpnqug7fCwdv3e7ahd6S+nqP2n8UKF6oPdTH7HEy9+u2GykII0kC/xArNQL
	S+VnvJLTgqVkdjiEV0fq0dpmqrq1rVlrtGoE826TCmDV9+oZG6Sbm2HXs21xdcU4
	AbJdkOhUNHt6f5Cyd9esvXBSuHdEFHfF36o6ddl/+x96WcR8KIBFwX2fQevVaXDA
	5XL+HP3OgfKqHJKegjn0pu2ev+Qoqzt7V53O2VenYhLZU04AuTDziRC6PJnpIC1Z
	SVzfqfP2Pnj30h0nTfPusHTGccI7r0Ad1NNbJDW85o/Nqsj7wx+55jvpzxrSFfMj
	Pfg6ow==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejgyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 05:16:49 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67906c453b8so9226668d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 21:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670209; x=1796275009; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=eZkHRtwOt4k1IQ12BOGu4YH3R3fWykmI4nfnyBN/LpOyKv981uQBmUN0FsOumOjaZg
         9mcYMTSlOIrDwSJ3Z1u2Klu8bpd2VMYmFq3VYYidtsEJwtN2WqsUofUAk/zynmpYxr/D
         0AnIaJy3gcXkbjR2/rZPDDnmzg73EmEGHHJ+fN3694OOE/7Hz6BLc5J/a0/rp4qpv3oj
         R2xOGlQtEuvikChsbjJ9lFEzw3aBjRVn6T/ZznxQE0gp/aTQJ2Lw8TSvnvb28m12JXIe
         MiOYkN9u0Lr3tJBzNfamVlugqwWOX8/Ash5uNRDAOONj2BPFVni5zloNmfD6R5tqv0U0
         7zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670209; x=1796275009;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=1Egm8wUd4hQ4154b/7mOhUz6Tfqur9eM3AQ1ovmkxfSSIN5eINbjOL/FuwyanJZJD3
         Kz5HomJ65aGlopv5EKjbuEoyLs7MxMRb/8nP+q+S5e4Wx6JANGKuZPvfozlJRm7ZqR1E
         eCTRZtUo9BkhbJTewfh4GhCiLam6gJ0GhfgXUnoDS/nRGY0Jufx1kiPQ8c9tx9T46Khz
         xhixj5MElslDfbgnPkTbyhAjXaarvRp9O3P53nMvzedbgcwx8/R5kXD52Npo6LbMA6B9
         eQF8eDPyoJpD5WDv0Gnxg7u2iHTVxyiUmsu4uIpFs+eLY82+yng2cM/atzDYhZX0wUgc
         OG6w==
X-Forwarded-Encrypted: i=1; AL+hErFr11vAyw0MMjBZc1HVFVQROdUUuQmxIf6TvnLEPgr8Sx3t6384D5xCDBNBYuPMKmjSEkcfs4+f6GgTjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/PMjWofZIR0vh+E41W+ji68BmGO5hXlhq31Zk0UFY/cjCBTT3e
	+pEU3rnB/5j3on2oUytMQyRasej0fknJjAsh9IX2Vnfi/pZpRq9VNgXoJGK33pD3Y6bYb490B+S
	+uZYxQiWfONAjfAYQHn0xV8UipltVMk7IrutywYEBXwca2cQp7SDxpcO9f1JRp3xfgoUG5DM=
X-Gm-Gg: AZFdTZdjBclMYnDBs9ccbZwrHwTwUHhYsPiktDG5yRoIOzNAGVu/T655b94o+28oWP8
	bBv6UJsEzPRz7DZI4yezVd1UdL8xuqAflJ5qRK1ghnutmQpNb279QAIopQ0SHaahhYsa9086eON
	esN36163bIRMmfagNTEvdMVZ4AuWYn8fOGxMLcfh3j2S3IojfqVSId7rPwlas7n1Z4Iv+qkdBD4
	qZgP1BcT4XdAZMi0EuWKqQOKbyC+r5P2tcVgqVWQXfrwllbPU6EJalK8QKk5G22ZcE7j5KwHoyr
	bO1P4UYSdqdy8eo/EiFsXtxIDDCrGCnoMIe2UsbXk2rMjwG7e1lwFJKv+DUvN5hsfE6XrW/tUP1
	y5uOMTGh6ynI/+HUNv8RmtSr+pZOz3gnT7y+9WDzkTTS6Y8bkOxKx3LSUfWGymazEn2LnnqvAlv
	jjwmBSJUko2Q==
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709795d50.46.1795670208664;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709789d50.46.1795670208139;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa545sm9644255d50.2.2026.11.25.21.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:16:47 -0800 (PST)
Date: Thu, 26 Nov 2026 00:16:43 -0500
Message-ID: <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
In-Reply-To: <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
 <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX9NVJIy2kdMu/
 Up2wuBD3E3SCOKTT2uD0ZsKNfyzD+ZExczrTCfxfUtDiGfX1i2uVJJ4OLLy07SJGHjLnABeqoBb
 nRneqyflkXHcYQ+f/ofWB4VUzeRi53XKkUqEHQiPybdVnkD4VQ56seZxpdebrYtoEIh9zDYOUxP
 W1ph69pxbXw45/A/GUF7AWK6VQ/D4opzwglMov/Q7uUHCu1Yo1wOipeItrPQ1QwRx838Y8cgLdi
 S+9OZKdU/D1R9dwd5A3Y7NDsn1NsYL8iCV/lUP6YU8NPcOK8ek50MG2yT6nAZJ4g291szgkMSyU
 Ijf7tXVbITHFptqw4ZiRKmtkFIsmivrjm0u+UJq8eBDEpCGLi5qO/xOvwCPl0BcACZ3spRJwuIC
 WpErp9ls6vw/mLvOedpobkUJ2Rlrad6LYtmf4IHbTh37Kt1vhKbvHXaEW/n+uif73mgbvPyfwZj
 mXnc9e2kxmcrd+EP5dw==
X-Proofpoint-GUID: jDwKklhMKq4YnJ1pdN6DJDMS8fWpELQs
X-Proofpoint-ORIG-GUID: jDwKklhMKq4YnJ1pdN6DJDMS8fWpELQs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX/V5kcv4T0tB5
 o5jmTS0O7AnRyvt3sk1vK0bgRaw+tliv4tpAp/yficLN320eEbjqGT3HbaIZ7j5WzLKwx2Izb2x
 WB6lA3/p80GWb5zqYnrRfdlkGHetcH0=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07c0c1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xvfqbYfxAAAA:20 a=KF8kK5mtAAAA:8 a=OGjWj8McAAAA:8 a=IWwISAFmO_-9T5kqGVcA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=zNK5Gj0fNQ2RFkdt29ku:22 a=UYjydHh6ynBBc6_pBLvz:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211650_473046_94FE9667 
X-CRM114-Status: GOOD (  15.88  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWNlbm93eSwKCk9uIE1vbiwgMDkgTm92IDIwMjYgMjM6NTY6NDcgKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMTEtMDnkuIDnmoQgMDc6NDcgLTA1MDDvvIxHdW9kb25n
IFh15YaZ6YGT77yaCgpbLi4uXQoKPiA+ICtlbnVtIHsKPiA+ICsJUklTQ1ZfSVNBX0JBU0VfSU1B
LAo+Cj4gSSBtYXkgaGF2ZSBtaXNzZWQgc29tZXRoaW5nLCBidXQgd291bGQgaXQgYmUgd29ydGgg
dG8gYWRkIGEgR0MgdGllcj8KPgo+IEkgdGhpbmsgbWFueSBMaW51eCBkaXN0cm9zIGhhdmUgR0Mg
ZGVmaW5lZCBhcyB0aGVpciBiYXNlbGluZS4KClRoYW5rcyBmb3IgcmFpc2luZyB0aGlzLgoKQSBz
aW5nbGUgYml0IGZvciAnUlY2NEdDJyBzZWVtcyB0byBoYXZlIG5vIHVzZXIgdG8gbWUsIHNvIEkg
d291bGQKcHJlZmVyIG5vdCB0byBhZGQgaXQuIEFsbG93IG1lIHRvIGV4cGxhaW4uCgpHIGlzIGEg
Y29tYmluYXRpb24gb2YgZXh0ZW5zaW9ucyBkZWZpbmVkIGluIHRoZSBlYXJseSBkYXlzIG9mIHRo
ZQpSSVNDLVYgSVNBIHNwZWM6IHRoZSB1bnByaXZpbGVnZWQgbWFudWFsIGRlZmluZXMgaXQgYXMg
YW4gYWJicmV2aWF0aW9uCmZvciBJTUFGRFppY3NyX1ppZmVuY2VpLCAib3VyIHN0YW5kYXJkIGdl
bmVyYWwtcHVycG9zZSBJU0EiIFsxXS4KCkkgY2hlY2tlZCwgYW5kIHlvdSBhcmUgcmlnaHQgdGhh
dCBpdCBpcyB0aGUgYmFzZWxpbmUgaW4gcHJhY3RpY2U6IEdDQwpkZWZhdWx0cyByaXNjdjY0IHRv
IC1tYXJjaD1ydjY0Z2MsIGFuZCBEZWJpYW4sIEZlZG9yYSBhbmQgVWJ1bnR1CihiZWZvcmUgMjUu
MTApIGJ1aWxkIHdpdGggdGhhdCBkZWZhdWx0LiBCdXQgbXkgdW5kZXJzdGFuZGluZyBpcywgRyBp
cyBhCmJ1aWxkLXRpbWUgYmFzZWxpbmUgb25seS4gTm90aGluZyBjaGVja3MgZm9yIEcgYXQgcnVu
IHRpbWU7IG9uIGEgY29yZQp3aXRob3V0IEYsIEQgb3IgQywgYW4gcnY2NGdjIGRpc3RybyB1c2Vy
bGFuZCBqdXN0IHRha2VzIFNJR0lMTCBvbiB0aGUKZmlyc3Qgc3VjaCBpbnN0cnVjdGlvbi4KCkFu
eXdheSwgd2hhdCB0aGlzIHNlcmllcyBpbnRlbmRzIHRvIGV4cG9ydCB0byB1c2VyIHNwYWNlIGlz
IHRoZSBwcm9maWxlCmxldmVsIChSVkEyMFU2NCwgUlZBMjJVNjQsIFJWQTIzVTY0KS4gRm9yIGV4
YW1wbGUsIGEgZ2xpYmMtaHdjYXBzIGRlc2lnbgpjYW4gZmFsbCBiYWNrIHRvIHJ2YTIwdTY0IHdo
ZW4gaXRzIHJ1bi10aW1lIGNoZWNrIGZpbmRzIG5vIHJ2YTIzdTY0LgoKUFM6IEluIHRob3NlIHRl
cm1zIHRoZSBjb3VudGVycGFydCBvZiBydjY0Z2MgaXMgUlZBMjBVNjQgWzJdCihleGNsdWRpbmcg
WmlmZW5jZWksIHdoaWNoIHRoZSBwcm9maWxlcyBtYW5kYXRlIG9ubHkgaW4gdGhlIFMgdmFyaWFu
dHMKWzNdIGFuZCB3aGljaCwgYXMgbm90ZWQgaW4gaHdwcm9iZS5yc3QgWzRdLCBpcyBub3QgaW50
ZW5kZWQgZm9yIGRpcmVjdAp1c2UgYnkgdXNlciBzcGFjZSkuCgpSVkEyMFU2NCBhbmQgUlZBMjJV
NjQgY2FtZSB1cCBpbiB0aGUgTFBDMjYgZGlzY3Vzc2lvbiBhcyB3ZWxsIFs1XS4gSQp3b3VsZCBs
aWtlIHRvIGFkZCB0aGVtIGluIGEgZm9sbG93LXVwLCBwcm9iYWJseSBub3QgaW4gdGhpcyBzZXJp
ZXMsIGlmCnRoZSByZXZpZXdlcnMgaGVyZSBhZ3JlZS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9ibG9iL21haW4vbW9kdWxlcy91bnByaXYvcGFnZXMvbmFt
aW5nLmFkb2MKWzJdIGh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1Yi5pby9ydmEyMy9ydmEtbWFuZGF0
b3J5LWV4dGVuc2lvbnMuaHRtbApbM10gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXBy
b2ZpbGVzL2Jsb2IvbWFpbi9zcmMvcHJvZmlsZXMuYWRvYywKICAgIFJWQTIwVTY0IHNlY3Rpb24s
IHRoZSBub3RlIG9uIFppZmVuY2VpCls0XSBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QsIFJJU0NWX0hXUFJPQkVfS0VZX0JBU0VfQkVIQVZJT1IKWzVdIGh0dHBzOi8vbHBjLmV2
ZW50cy9ldmVudC8yMC9jb250cmlidXRpb25zLzI2MjYvCgpHdW9kb25nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
