Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E43AC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eW1qgueYiSMWPtEh/CvqklqTAjWcbXYO1F5EPWpnXWI=; b=BOdo7Jct7xN9ix
	fhz1fbjIXmrt1b4BnmuWiRreYmrZdxR5s2N3u7Wb+U/pi8YFFD6J9IrQiWHEFsotTy2kwu13usLSf
	upC97FV4Mu0Ix/Wl3pnYrvcALNUTU5+qh+QCpnzYO2dYr2tPozYEksQy9cWWcyUdaNCTsog8TBcYT
	3e1QadLzQO2MD7seVriRiFud1s//70WN/VGAkZckWf9PHum3YY73ii79ZfFLopc5MZGQccYGsBZG9
	xXFyc/LPnXQlrtF0K+JYNIexLDN81H2jegT5EXo/GfTbfPFJxJiUbvA8Xmut/DR87enx3bBu1vSC/
	mXXPx+VerKYsb7vK+B3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYP-00000002LAM-15KY;
	Tue, 04 Jun 2024 12:46:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYL-00000002L91-1i0M
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:46:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f64b60a937so718875ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505170; x=1718109970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlFfGyvlYpwu5mumxxHK+PtmO5s3+buvtb+SvPxc6V0=;
        b=GvUxTDPOvSLes+m0OyyvCm+hvTVv24iKkBVlhkzgqqeIcvH8aK+M2spURMzalmOciM
         5r9GzmsffY+9VArfSQCYEM6om7GLlB7pRnFkiiE0dphfaHYNgEHo4/Yzm+sbpxJUVUlY
         BBOjG3ZGVR5le/GkpDte4E8eeYUEGLCWpRuRmxXQKylhtWP/QhG0W5VrFM0gU0KmQwcQ
         DNvkaYPCul4UdeiI6oJV8Qcf4XEEV+27cHUXDH2Fl04zLclmv64vAhA2o4+Go4iyFLhT
         YrtLQbIzm97Ph+e+EtFQN6DWBTGVy3l9e7Ua1wrIozaAUIqWYXLYXadpVCVDYW1D/PcV
         xEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505170; x=1718109970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlFfGyvlYpwu5mumxxHK+PtmO5s3+buvtb+SvPxc6V0=;
        b=uI64vANI9DkK2BYF4YriefDmyrnQw1gAsV1d4hEUk7qoAnL+tf1JcH5KjTpLxY29QC
         YM6opWr67Li1MV2xqTVEPB7+K2V//hLFeBYXPDuSCIP44gyVYwu7br6SY7H6c+YPO+rG
         pg5VNr+CKERR+6MW6SvcUFcxamumPp4GzIGeiZjkM+Um7hT79laYcBN2cVrEYmUsI3Y7
         hiKcG7eAD1veH/DeGP28QpHruhU0RswkGksQ3iRq1rqATrNd6tQug1ZHjDDPejlUJI44
         YrRqNX4pEgn7b0jGUlwoMUo5b+dzJdHDqqBfc63vlrFSbjooPy4m7OCzZha5rVJNAjlv
         z8jA==
X-Forwarded-Encrypted: i=1; AJvYcCX9kH0STvyvHD9bryqxxrZPRiQPu9nPzHE2M6UFTJlM/xgD+5hOPSGeWtH+3iaz5s7EEO34Qd3Z3nceQJndjbhbGeJ75xz7sMZlMsYCqGRV
X-Gm-Message-State: AOJu0YyQCzK4kFc+fVGVzGby0GfLYrosCt/iXC8bY/DsYaMsXY4YqOt6
	0aUhwKKWShMFiBSAFSGZPlmpeiIO0ePpEB63thKwCIVybBEJd0jXLvgzKUAjqzTNn8rlfm6Pvlj
	28zI=
X-Google-Smtp-Source: AGHT+IHYa0Aw6/ZCoGM1K6W/t5DQ4yQlSVhFECl9FxLx/IWFviwLhyvqWExcUz4B81YUgol+CdCuQw==
X-Received: by 2002:a17:902:ea0e:b0:1f2:fbc8:643c with SMTP id d9443c01a7336-1f6370f2847mr137326235ad.3.1717505170463;
        Tue, 04 Jun 2024 05:46:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 00/16] Add support for a few Zc* extensions, Zcmop and Zimop
Date: Tue,  4 Jun 2024 14:45:32 +0200
Message-ID: <20240604124550.3214710-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054613_704675_BC02523D 
X-CRM114-Status: GOOD (  10.70  )
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

QWRkIHN1cHBvcnQgZm9yICh5ZXQgYWdhaW4pIG1vcmUgUlZBMjNVNjQgbWlzc2luZyBleHRlbnNp
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmltb3AsIFpjbW9wLCBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBJU0Egc3RyaW5nCnBhcnNpbmcsIGh3cHJvYmUgYW5kIGt2bSBzdXBwb3J0LiBa
Y2UsIFpjbXQgYW5kIFpjbXAgZXh0ZW5zaW9ucyBoYXZlCmJlZW4gbGVmdCBvdXQgc2luY2UgdGhl
eSB0YXJnZXQgbWljcm9jb250cm9sbGVycy9lbWJlZGRlZCBDUFVzIGFuZCBhcmUKbm90IG5lZWRl
ZCBieSBSVkEyM1U2NC4KClNpbmNlIFpjKiBleHRlbnNpb25zIHN0YXRlcyB0aGF0IEMgaW1wbGll
cyBaY2EsIFpjZiAoaWYgRiBhbmQgUlYzMiksIFpjZAooaWYgRCksIHRoaXMgc2VyaWVzIG1vZGlm
aWVzIHRoZSB3YXkgSVNBIHN0cmluZyBpcyBwYXJzZWQgYW5kIG5vdyBkb2VzCml0IGluIHR3byBw
aGFzZXMuIEZpcnN0IG9uZSBwYXJzZXMgdGhlIHN0cmluZyBhbmQgdGhlIHNlY29uZCBvbmUKdmFs
aWRhdGVzIGl0IGZvciB0aGUgZmluYWwgSVNBIGRlc2NyaXB0aW9uLgoKTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0MDQxMDMyNTQuMTc1MjgzNC0xLWNsZWdl
ckByaXZvc2luYy5jb20vIFsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDA0MDkxNDM4MzkuNTU4Nzg0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzJdCgotLS0KCnY2Ogog
LSBSZWJhc2VkIG9uIHJpc2N2L2Zvci1uZXh0CiAtIFJlbW92ZSB0ZXJuYXJ5IG9wZXJhdG9yIHRv
IHVzZSAnaWYoKScgaW5zdGVhZCBpbiBleHRlbnNpb24gY2hlY2tzCiAtIHY1OiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MTcxNDUzMDIuOTcxMDE5LTEtY2xlZ2VyQHJpdm9zaW5j
LmNvbS8KCnY1OgogLSBNZXJnZWQgaW4gWmltb3AgdG8gYXZvaWQgYW55IHVuZWVkZWQgc2VyaWVz
IGRlcGVuZGVuY2llcwogLSBSZXdvcmsgZGVwZW5kZW5jeSByZXNvbHV0aW9uIGxvb3AgdG8gbG9v
cCBvbiBzb3VyY2UgaXNhIGZpcnN0IHJhdGhlcgogICB0aGFuIG9uIGFsbCBleHRlbnNpb24uCiAt
IERpc2FibGVkIGV4dGVuc2lvbnMgaW4gc291cmNlIGlzYSBvbmNlIHNldCBpbiByZXNvbHZlZCBp
c2EKIC0gUmVuYW1lIHJpc2N2X3Jlc29sdmVfaXNhKCkgcGFyYW1ldGVycwogLSB2NDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDI5MTUwNTUzLjYyNTE2NS0xLWNsZWdlckByaXZv
c2luYy5jb20vCgp2NDoKIC0gTW9kaWZ5IHZhbGlkYXRlKCkgY2FsbGJhY2tzIHRvIHJldHVybiAw
LCAtRVBST0JFREVGRVIgb3IgYW5vdGhlcgogICBlcnJvci4KIC0gdjM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI0MDQyMzEyNDMyNi4yNTMyNzk2LTEtY2xlZ2VyQHJpdm9zaW5jLmNv
bS8KCnYzOgogLSBGaXggdHlwbyAiZXhpc3RzIiAtPiAiZXhpc3QiCiAtIFJlbW92ZSBDIGltcGxp
ZXMgWmNhLCBaY2QsIFpjZiwgZHQtYmluZGluZ3MgcnVsZXMKIC0gUmV3b3JrIElTQSBzdHJpbmcg
cmVzb2x2ZXIgdG8gaGFuZGxlIGRlcGVuZGVuY2llcwogLSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQwNDE4MTI0MzAwLjEzODc5NzgtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoK
djI6CiAtIEFkZCBaYyogZGVwZW5kZW5jaWVzIHZhbGlkYXRpb24gaW4gZHQtYmluZGluZ3MKIC0g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA0MTAwOTExMDYuNzQ5MjMzLTEt
Y2xlZ2VyQHJpdm9zaW5jLmNvbS8KCkNsw6ltZW50IEzDqWdlciAoMTYpOgogIGR0LWJpbmRpbmdz
OiByaXNjdjogYWRkIFppbW9wIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNjdjogYWRk
IElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmltb3AKICByaXNjdjogaHdwcm9iZTogZXhwb3J0
IFppbW9wIElTQSBleHRlbnNpb24KICBSSVNDLVY6IEtWTTogQWxsb3cgWmltb3AgZXh0ZW5zaW9u
IGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFppbW9wIGV4dGVuc2lv
biB0byBnZXQtcmVnLWxpc3QgdGVzdAogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpjYSwgWmNm
LCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uCiAgICBkZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQg
SVNBIGV4dGVuc2lvbnMgdmFsaWRhdGlvbiBjYWxsYmFjawogIHJpc2N2OiBhZGQgSVNBIHBhcnNp
bmcgZm9yIFpjYSwgWmNmLCBaY2QgYW5kIFpjYgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNh
LCBaY2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb25zCiAgUklTQy1WOiBLVk06IEFsbG93IFpj
YSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6
IHNlbGZ0ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QK
ICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBaY21vcCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9u
CiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFpjbW9wCiAgcmlzY3Y6IGh3
cHJvYmU6IGV4cG9ydCBaY21vcCBJU0EgZXh0ZW5zaW9uCiAgUklTQy1WOiBLVk06IEFsbG93IFpj
bW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBa
Y21vcCBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKCiBEb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgMjggKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA5NSArKysrKysKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3B1ZmVhdHVyZS5oICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgIDcgKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAgNiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgICAgICAgICAgIHwgMjc4ICsrKysrKysrKysrKy0tLS0tLQogYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgICAgIHwgICA2ICsKIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICAxMiArCiAuLi4vc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMjQgKysKIDEwIGZpbGVzIGNoYW5n
ZWQsIDM3NSBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMoLSkKCi0tIAoyLjQ1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
