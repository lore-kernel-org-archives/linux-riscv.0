Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C3606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0B5LAIDA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lG8UWN3J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0L5v/eA6FAIppReyj9Vljra8XnLP+yq26jItH7uMHnI=; b=0B5LAIDANCBG8kQaBxT2disIz/
	FWhHIS4fN91tUHFLKZbR0sFZNxpOa+LenZ9508VqxH9tzmpbohVXuqJBKafTUzGFqOZ7M7YMwpgqZ
	SxKWbelN336bxwq8v4jBhJkcybwNf2uqNudhJsPoG6/Y3dDa42bfoS2CT5EeVfhjQJpzGzvmZIOc7
	FTRtKqoHJGCoeRMFpO4DqbM7WUW+FvvR702Iju4NixQzV2H+alf0dVTkNGFdnye0Mip+xuJonIcr+
	bNRvvb65N8b3HaktobrpNoNQVhPbL+32buLTaOETVTdyZ5z9QeWgDZAOrA8VU7KdsIegf9ANlPSf2
	aNYK+4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTN-0000000BZuY-0f55;
	Wed, 25 Nov 2026 23:32:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMT7-0000000BZaO-2gOH
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:32:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5542660f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649523; x=1796254323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=lG8UWN3Jnjq5nNqJAXNpYnmszq3MZpRDZ5uinsMKMRG2FXvZayy72pLsPteVdWp1Q9
         rKCUOjyK5VyjmpbRaZIb3AjDoDZCDeemDL4wOvz7vNuNK8Tic9ueUI8tEWcxZ0Ns6D2U
         9mXF++pV1TytvLMtyXaJf9GOHg+c7S/l3xrgV8OgOCwtAqrCPQLBO7WKhqSHios71hIa
         65E0w3qPgaZherQJjHpugORa9qdM2++jyO5YNaFPQZEwgb0UE044qZQOnmWdqTFLD8jE
         lRv13HLiJtp2UQmwFlA6s/06iwmmmBSek0BjxCDqia3KcXfMqMr50Npkz4nj6gwS9UPR
         RI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649523; x=1796254323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlVPxpw04CeXrcuckgG9gRUvr8QzkEIp3OzwElDk6ZE=;
        b=lYRRNyeGvQOdSmbEYMKOHVJd3IQLyG7EJl0QUSAjf2FLSSFJXUQkUqpm494YkZssuc
         Oi/uokcELAFq29ZY5Zr6aRrjIE1fODdDOe+LiMgug7t5oQkGRHMjt/635s5S3aVBngzf
         7ygQwjyvTJAbi8whWoh9qfql3mOwBLiZ//a1OKD31M92u9kjGjZBuAzo/uRcB4O6Bxbu
         kOfk5VEgfk4asZyhU/qQvir2RpnJdYlzp/vSegSFsUemk+X4NH2lD9muvCaX9oU4URPx
         H+XiM9UKa7B3O2lTCKDEc41x6bY+7OWepCiBG23hqlNy+E3hgHKmgbxaJdWg+uqxztBd
         pGVQ==
X-Gm-Message-State: APuU4Z8llOOXRz6zMrZr933FYv42CMVBG7JO9rK6ORc55vITyqWh0JH5
	ZJSOlrVnafsfYQaGOjClVHbJlIpFJeVMbPRXrxz9YatwsvG75aDi2283HUiXH0EUZVs=
X-Gm-Gg: AZFdTZf6M2hKKOxR7orIYvq66ZkR//CPXET9D03KGOC8BMWExjv0qNU7ZRi+Snkejia
	BGR68hSiiJ1qRlpLwtzpc8qTbN3fbdcDrV0k4fVFnvT0fFry8w/ppCiwmljnUtKapf383k/L5wH
	wwatytAa5SWeSNsc4UzxacbnTt8VinhyffLXzYSEvJlsxdDu8jY3g6vyQOnz3BQCmOz7mzNAQXm
	+l5NJoApXYMCX5skpjLNdyZxRWHM1ViI2dnvwcFsPBt4trERmvliPrBtkLiodMnUQdFm4CDXBNg
	TYeG5qrCljzuEXzJJspa37qkJpXUTxgv2ugX8R6zI8NDuPL8iscMOFebVK8Q6TYEUyNvW/ajyuj
	QJqN/gVbzfs46X4kk5U79Lj+BScrXcO4NZkiNk5tCzLGprhSdCaYTH0hSmFqeNeBI7/nv5tdCjO
	x98+aon+byA+RWEyZZti9YlzebscT91PrC97vjCj2Sx36LznNmnOnRZ6LQAVVh3MIH3rXiSeP72
	DPZQHGmBIgYIGf8yHcJzirrdhzvqz58vvTeYHE4ib0+8wg32oISKRTPQkonSXu+8E0DA37NdAYL
	unXp0A1rg1L5rXB7KQcNA7Db3jb+Wa+m581EaNrByWvQwvzKSCob1iK3yTAbhPOuFn5ngkGXMdH
	R2Lyf4plPLw==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr36258812f8f.0.1795649523589;
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36432985f8f.49.2026.11.25.15.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:03 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 18/19] riscv: dts: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:19 +0000
Message-ID: <20261125233020.1380594-19-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153205_759420_E42C01CA 
X-CRM114-Status: GOOD (  15.98  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIHRoZSBpbml0aWFsIEVTUDMyLVA0IFNvQyBkZXNjcmlwdGlvbiBmb3IgdGhlIENMSUMsIENM
SU5ULAppbnRlcnJ1cHQgbWF0cml4IGFuZCBVQVJUMC4gRGVzY3JpYmUgdGhlIGJvYXJkJ3MgMzIg
TWlCIG9mIFBTUkFNIGFuZAp0aGUgNDAgTUh6IGNsb2NrIHVzZWQgYnkgVUFSVDAuCgpCdWlsZCB0
aGUgYm9hcmQgRFRCIHdoZW4gRVNQMzItUDQgQ0xJQyBzdXBwb3J0IGlzIGVuYWJsZWQuIFRoZSBp
bml0aWFsCmRldmljZSB0cmVlIHN1cHBvcnRzIGJvb3RpbmcgdG8gYSBVQVJUIHNoZWxsIG9uIHRo
ZSBXYXZlc2hhcmUgYm9hcmQuClVzZSBVQVJUMCBhcyB0aGUgZGVmYXVsdCBjb25zb2xlIGF0IDEx
NTIwMCBiYXVkLgoKRGVzY3JpYmUgYm90aCBIUCBoYXJ0cyBpbiB0aGUgRVNQMzItUDQgU29DIGRl
dmljZSB0cmVlLgpUaGUgaW5pdGlhbCBMaW51eCBzdXBwb3J0IHJ1bnMgb24gdGhlIGJvb3QgaGFy
dCBvbmx5LgoKU2VsZWN0IHRoZSByZXZpc2lvbiAzLnggaW50ZXJydXB0IG1hdHJpeCBvbiB0aGUg
V2F2ZXNoYXJlIGJvYXJkLgoKVGhlIENMSU5UIHRpbWViYXNlIGZvbGxvd3MgdGhlIENQVSdzIGNs
b2NrLiBUaGUgZmlybXdhcmUgbXVzdCBwb3B1bGF0ZQovY3B1cy90aW1lYmFzZS1mcmVxdWVuY3kg
d2l0aCB0aGUgYWN0dWFsIHJhdGUgYmVmb3JlIGJvb3RpbmcgTGludXguCgpBSSBhc3Npc3RlZCB3
aXRoIGZvcm1hdHRpbmcgdGhlIERUUyBhbmQgdmFsaWRhdGluZyB0aGUgcmVzdWx0aW5nIERUQi4K
Ckxpbms6IGh0dHBzOi8vZG9jcy53YXZlc2hhcmUuY29tL0VTUDMyLVA0LU1vZHVsZS1ERVYtS0lU
ClNpZ25lZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhnMjAwODBAZ21haWwuY29t
PgotLS0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAx
ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL01ha2VmaWxlICAgICAgICB8ICAyICsK
IC4uLi9lc3AzMnA0LXdhdmVzaGFyZS1tb2R1bGUtZGV2LWtpdC5kdHMgICAgICB8IDQ2ICsrKysr
KysrKysrKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2VzcDMycDQuZHRzaSAgICB8
IDY0ICsrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2VzcHJlc3NpZi9NYWtl
ZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2Vz
cDMycDQtd2F2ZXNoYXJlLW1vZHVsZS1kZXYta2l0LmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2VzcDMycDQuZHRzaQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxl
CmluZGV4IDY5ZDg3NTFmYjE3Yy4uZmEwZjIzZGUyNjE2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKQEAg
LTMsNiArMyw3IEBAIHN1YmRpci15ICs9IGFsbHdpbm5lcgogc3ViZGlyLXkgKz0gYW5kZXMKIHN1
YmRpci15ICs9IGFubG9naWMKIHN1YmRpci15ICs9IGNhbmFhbgorc3ViZGlyLXkgKz0gZXNwcmVz
c2lmCiBzdWJkaXIteSArPSBlc3dpbgogc3ViZGlyLXkgKz0gbWljcm9jaGlwCiBzdWJkaXIteSAr
PSByZW5lc2FzCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2VzcHJlc3NpZi9NYWtl
ZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL01ha2VmaWxlCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZmQ4OTYxNjg2MmZiCi0tLSAvZGV2L251bGwK
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9lc3ByZXNzaWYvTWFrZWZpbGUKQEAgLTAsMCArMSwy
IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCitkdGItJChDT05GSUdfUklT
Q1ZfRVNQMzJQNF9DTElDKSArPSBlc3AzMnA0LXdhdmVzaGFyZS1tb2R1bGUtZGV2LWtpdC5kdGIK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2VzcDMycDQtd2F2ZXNo
YXJlLW1vZHVsZS1kZXYta2l0LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2Vz
cDMycDQtd2F2ZXNoYXJlLW1vZHVsZS1kZXYta2l0LmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLmJkZWYzMjhlMTllZgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL2VzcDMycDQtd2F2ZXNoYXJlLW1vZHVsZS1kZXYta2l0
LmR0cwpAQCAtMCwwICsxLDQ2IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCisvZHRzLXYxLzsKKworI2luY2x1ZGUgImVzcDMycDQu
ZHRzaSIKKworLyB7CisJbW9kZWwgPSAiV2F2ZXNoYXJlIEVTUDMyLVA0LU1vZHVsZS1ERVYtS0lU
IjsKKwljb21wYXRpYmxlID0gIndhdmVzaGFyZSxlc3AzMi1wNC1tb2R1bGUtZGV2LWtpdCIsICJl
c3AsZXNwMzJwNCI7CisJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJI3NpemUtY2VsbHMgPSA8MT47
CisKKwlhbGlhc2VzIHsKKwkJc2VyaWFsMCA9ICZ1YXJ0MDsKKwl9OworCisJY2hvc2VuIHsKKwkJ
c3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7CisJfTsKKworCXh0YWw0MG06IGNsb2Nr
LTQwMDAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7CisJCSNjbG9jay1jZWxs
cyA9IDwwPjsKKwkJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMDAwPjsKKwl9OworCisJbWVtb3J5
QDQ4MDAwMDAwIHsKKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKKwkJcmVnID0gPDB4NDgwMDAw
MDAgMHgwMjAwMDAwMD47CisJfTsKK307CisKKyZjbGljIHsKKwljb21wYXRpYmxlID0gImVzcCxl
c3AzMnA0LXYzLWNsaWMiOworfTsKKworJmludG10eDAgeworCWNvbXBhdGlibGUgPSAiZXNwLGVz
cDMycDQtdjMtaW50bXR4IjsKKworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZ1YXJ0MCB7CisJ
Y2xvY2tzID0gPCZ4dGFsNDBtPjsKKworCXN0YXR1cyA9ICJva2F5IjsKK307CmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2VzcHJlc3NpZi9lc3AzMnA0LmR0c2kgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL2VzcHJlc3NpZi9lc3AzMnA0LmR0c2kKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi4yMTFlZWY2MmI1MmUKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2VzcHJlc3NpZi9lc3AzMnA0LmR0c2kKQEAgLTAsMCArMSw2NCBAQAorLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQor
CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+CisKKy8g
eworCWNwdXMgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47
CisJCS8qIEZpcm13YXJlIHN1cHBsaWVzIHRoZSB0aW1lYmFzZS1mcmVxdWVuY3kgYmVmb3JlIGJv
b3QuICovCisKKwkJY3B1QDAgeworCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsKKwkJCWNvbXBhdGli
bGUgPSAiZXNwLGVzcDMycDQtaHAiLCAicmlzY3YiOworCQkJcmVnID0gPDA+OworCQkJbW11LXR5
cGUgPSAicmlzY3Ysbm9uZSI7CisJCQlyaXNjdixpc2EtYmFzZSA9ICJydjMyaSI7CisJCQlyaXNj
dixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImMiLAorCQkJCQkgICAgICAg
InppY3NyIiwgInppZmVuY2VpIjsKKwkJfTsKKworCQljcHVAMSB7CisJCQlkZXZpY2VfdHlwZSA9
ICJjcHUiOworCQkJY29tcGF0aWJsZSA9ICJlc3AsZXNwMzJwNC1ocCIsICJyaXNjdiI7CisJCQly
ZWcgPSA8MT47CisJCQltbXUtdHlwZSA9ICJyaXNjdixub25lIjsKKwkJCXJpc2N2LGlzYS1iYXNl
ID0gInJ2MzJpIjsKKwkJCXJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYi
LCAiYyIsCisJCQkJCSAgICAgICAiemljc3IiLCAiemlmZW5jZWkiOworCQl9OworCX07CisKKwlj
bGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckAyMDgwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAiZXNw
LGVzcDMycDQtY2xpYyI7CisJCXJlZyA9IDwweDIwODAwMDAwIDB4MTAwMDA+OworCQlpbnRlcnJ1
cHQtY29udHJvbGxlcjsKKwkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKKwl9OworCisJaW50bXR4
MDogaW50ZXJydXB0LWNvbnRyb2xsZXJANTAwZDYwMDAgeworCQljb21wYXRpYmxlID0gImVzcCxl
c3AzMnA0LWludG10eCI7CisJCXJlZyA9IDwweDUwMGQ2MDAwIDB4NDAwPjsKKwkJaW50ZXJydXB0
LWNvbnRyb2xsZXI7CisJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CisJCSNhZGRyZXNzLWNlbGxz
ID0gPDA+OworCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZjbGljPjsKKworCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOworCX07CisKKwl1YXJ0MDogc2VyaWFsQDUwMGNhMDAwIHsKKwkJY29tcGF0aWJsZSA9
ICJlc3AsZXNwMzJwNC11YXJ0IjsKKwkJcmVnID0gPDB4NTAwY2EwMDAgMHgxMDAwPjsKKwkJaW50
ZXJydXB0cy1leHRlbmRlZCA9IDwmaW50bXR4MCAzMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwor
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCX07CisKKwl0aW1lckAyMDAwMDAwMCB7CisJCWNvbXBh
dGlibGUgPSAiZXNwLGVzcDMycDQtY2xpbnQiOworCQlyZWcgPSA8MHgyMDAwMDAwMCAweDEwMDAw
PjsKKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY2xpYyAzIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJCSAgICAgIDwmY2xpYyA3IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCX07Cit9OwotLSAK
Mi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
