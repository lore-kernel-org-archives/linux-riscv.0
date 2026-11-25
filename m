Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77B606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ExM1l+Td;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btS7ay6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y9DXL/Zd8DnjN15M/kKyPiApE3NEYdiNWqCSXBcBsQU=; b=ExM1l+Tdp0MmlHbT0ZlFNBkZVw
	stnE4ZkY+9dx0pZ8pNR1iZgl7EJL4aRWVBeZWZt9g1DYqR2lTxjpe97TJH8MF0vgkIsjwAvD8LBqG
	lGM4LHM17Liwk67nEper9xVyQ3PqrNsvZRKnICnTvMwJBfQy3TE0jiZFEkO8cwsr8HSe+Qj8QtSRB
	99D1Fx1RHVlfIp4yCjJ1h4+VoMS20STcFXjMQsaAj5LcAHHfYIv9O1ZE/n9+3AZFOl1gwNGFPk9Ri
	sTGrMu+M0yVkfet5jZxsoumpnrw8ItvZhPXUCYyRtBdKZUPeUPgCLTBq0pNRBEN5jp8frz857YL5D
	CQ+cKGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRg-0000000BYIS-2EY3;
	Wed, 25 Nov 2026 23:30:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRd-0000000BYHk-2axY
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:30:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so35151195e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649431; x=1796254231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e35aD9xDuc1hKVMZ4DHpu/O6GiR6BdX7QfpIMiYdEOE=;
        b=btS7ay6YAazS3RNeYQg5OIXZhtWrfVi9m5HUTsapKG6YXjav4hzcoM7d7oYxoC713v
         Mcn8h30gAHgNl/u8t9zhszAWB1Gt0C0RAUUtCEXTqH1C6lOkOCijy8k5IgXSiwOhPyt0
         VfsiMOOe8OzNenbFWjBibiexQtkR0jxNvq7xmzo1DuYRiskYBpgTrATfhvPCqmr6JR4T
         HcSxLKPxmX8bLGuLGu5mqxr/NpmuC0K/0M1p8OBWzmPSC4t9i0UEA09CSQHOKSV90SRj
         +jT+iZDbNsngLcAqQiY3c0fEpEbehad6+rBjrAaKtgIKPBrA/tOynoza/FWCos7uT6QX
         lGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649431; x=1796254231;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e35aD9xDuc1hKVMZ4DHpu/O6GiR6BdX7QfpIMiYdEOE=;
        b=lYjJlgdgZ/zdO5BHmV4vj6y9VIFiZ8dZ+19Pb3eHJcjGP6DfesL4T1dJ27LnG08Gaz
         AAvdu/NDr51InC6N/ACVEEipwFqGufSrwcl1BWJsuH5ZOaAin06piJA0ZKbaodoKhyn2
         3NOqYT22CJQQ1isY13aVguQvipC/PTk56Yszt+R2GYAff1yYj8vuspD7vI1MxrScKw69
         Ec3sWTAaFkoCL5icADUqBW5KgWPTuMDzb0SuRG9FxGtkrAsxd4NnS3fRSCrG9BuPqygN
         wnE8dbNDdbB6Uh+WpD9fjEInphTJukH6mXek0hyFTOk6h+JOoUXdZ50ne8FozAW/xoxC
         TvWw==
X-Gm-Message-State: APuU4Z+DCLHZDNHGZ27AbTNmtGCfyT//qc60UMh2YdLnQtmrArvvOK46
	T3diHMd1X/Iga4idP91mNEU2CmtIOlI0Bjnar4gOwfnSpyMQ9HFI2Ryv+QPh2J4S9Yc=
X-Gm-Gg: AZFdTZfqi7T6LTBXIHFC7Gh7jtAi5Z/5oJCNE5Va1pYclm2GMRJNl0rOI3fUMJU5z//
	mm6lgRU6SL+Hi0FwhJSr54I3IUzkt53figL3PjzABIR7vdemhDyx9u9mKHxNGMafKJ72q2puVyq
	9Pthf1nJ5/GqpLrAA0lFwfiTJfzx2dZM7OVLTDNFrxKM0aAsQZgBJ4qttwl7HJeLcpBuZMRs9Zs
	bGbOtZ8KI19rsrB3ScSYBv09Sq+TjFIJQNV0z5zWn3aYw38zfVqCcK89Z3z+NA2f7nfqU6I4VqQ
	FgniGEngvcYbc0I0ggxqoDMo7GLujhWnV+3EG6ohK1e3bL1YbfyJbajwxYjnwhtDZj+oDWg1IoB
	LD/Wuq068++xtg1WNh3Btsi5TAHl47YEaUmQufhwRXAhDQotdUzEE0cTC6Rwx/RFmi/kl/lUkgT
	5d225VvAfzfxNaezEKG8Q1KJQgfgF/xLyXKMraePjajiMH04WIHlmGzzc3g9330Sy2jJCM1x8X+
	ZhEs1wXEG5qV/GzLeKhK8ui/NQ9wInhk2UURGLleYL1bNfeqJLh0oVnlvKE/cevVGPFDA9e9bod
	+krGxnutx1tAUn+MfMnPL0k8B27RDtk0ke+d6TZjKwCmhxKeHyvnDSWFvrkTE7Dq1k1bBc1TrSe
	9pgA/JFp0XOZiNXB63aq01GQZh/4nC6M=
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb888063f3mr484937095e9.16.1795649430462;
        Wed, 25 Nov 2026 15:30:30 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm35729850f8f.56.2026.11.25.15.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:29 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 00/19] riscv: Add initial support for Espressif ESP32-P4
Date: Wed, 25 Nov 2026 23:30:01 +0000
Message-ID: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153033_697864_4D285DC2 
X-CRM114-Status: GOOD (  17.54  )
X-Spam-Score: -1.9 (-)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGFkZHMgdGhlIGluaXRpYWwgc3VwcG9ydCBm
b3IgdGhlIEVzcHJlc3NpZidzCkVTUDMyLVA0IG9uIHRoZSBXYXZlc2hhcmUgRVNQMzItUDQtTW9k
dWxlLURFVi1LSVQuIEl0IGJvb3RzIGluIE0tbW9kZSBvbgphIFJWMzIgTk9NTVUga2VybmVsIHdp
dGggb25lIEhQIGhhcnQuCgpUaGUgc2VyaWVzIGFkZHMgQ0xJQyB0cmFwIGhhbmRsaW5nLCBkcml2
ZXJzIGZvciBjbGljIGFuZCBmb3IgaW50ZXJydXB0Cm1hdHJpeCwgYW5kIGV4dGVuZHMgdGhlIENM
SU5UIHRpbWVyIGRyaXZlci4gSXQgcmVzdG9yZXMgYSBwcmV2aW91c2x5CnJlbW92ZWQgRVNQMzIg
VUFSVCBkcml2ZXIgd2l0aCBFU1AzMi1QNCBVQVJUIHN1cHBvcnQgYW5kIGVhcmx5IGNvbnNvbGUK
c3VwcG9ydC4gSXQgYWxzbyBzeW5jaHJvbml6ZXMgdGhlIGluc3RydWN0aW9ucyB3cml0dGVuIHRv
IHRoZSBQU1JBTSwKYWxpZ25zIHRoZSBpbml0IGRhdGEgdG8gdGhlIEVTUDMyLVA0IFBNUCBncmFu
dWxhcml0eSwgYW5kIGl0IGFkZHMgRFQKYmluZGluZ3MgYW5kIHRoZSBib2FyZCBkZXZpY2V0cmVl
LgoKVGhlIGJvb3QgZmlybXdhcmUgaW5pdGlhbGl6ZXMgUFNSQU0sIGxvYWRzIHRoZSBrZXJuZWws
IERUQiBhbmQgdGhlCmluaXRyYW1mcyBmcm9tIHRoZSBtaWNyb1NELCBhbmQgaXQgc3VwcGxpZXMg
dGhlIHRpbWViYXNlLWZyZXF1ZW5jeQpiZWZvcmUganVtcGluZyBpbnRvIHRoZSBrZXJuZWwuCgpU
aGUgYm9vdGxvYWRlciBzb3VyY2UgYW5kIG1pY3JvU0QgYm9vdCBpbnN0cnVjdGlvbnMgYXJlIGF2
YWlsYWJsZSBhdDoKaHR0cHM6Ly9naXRodWIuY29tL3B1c2hkd29yZC93YXZlc2hhcmUtZXNwMzIt
cDQtYm9vdGxvYWRlci9ibG9iLzM5MDg4MGU4ODEyMDhhYjE2YWExNmViNTIwYjNlNWVhMGM2M2Mw
YTIvUkVBRE1FLm1kCgpJIHRlc3RlZCB0aGlzIHNlcmllcyBvbiB0aGUgaGFyZHdhcmUsIHRoZSBX
YXZlc2hhcmUKRVNQMzItUDQtTW9kdWxlLURFVi1LSVQgd2l0aCB0aGUgRVNQMzItUDQgcmV2aXNp
b24gdjMuMiB3aXRoIDMyTUIgb2YKUFNSQU0uIFRoZSBrZXJuZWwgYm9vdGVkIHRvIHRoZSBVQVJU
IHNoZWxsIGZyb20gdGhlIGluaXRyYW1mcy4gVGhlCi9wcm9jL2ludGVycnVwdHMgc2hvd2VkIHRo
ZSBDTElOVCBJUlEncyBpbmNyZWFzZWQsIFVBUlQwIGludGVycnVwdHMgd2VyZQpyb3V0ZWQgdGhy
b3VnaCB0aGUgaW50ZXJydXB0cyBtYXRyaXguIAoKSXQgd291bGQgYmUgbmljZSB0byB5b3UgYWxs
IHNlbmQgZmVlZGJhY2sgb24gcmVzdG9yaW5nIHRoZSBpbnRlcnJ1cHRlZApDTElDIGxldmVsIGJl
Zm9yZSBpcnFfZXhpdF9yY3UoKSBhbmQgdGhlIGludGVyZmFjZSBmb3IgcHJvcGFnYXRpbmcKaW5z
dHJ1Y3Rpb24tY2FjaGUgc3luYyBmYWlsdXJlcyB0byBOT01NVSBleGVjdXRhYmxlIGxvYWRpbmcs
IGFuZCBzaWduYWwKc2V0dXAuCgpBSSBkaXNjbGFpbWVyOiBJIGhhdmUgdXNlZCA2LjItU29sIHRv
IGFzc2lzdCBkZXZlbG9wbWVudCBhbmQgdG8gYXNzaXN0CmRlYnVnL3Ryb3VibGVzaG9vdCBzb21l
IG9uZ29pbmcgaXNzdWVzLiBJIGhhdmUgdXNlZCBDb2RleCdzIDYtU29sCndpdGggRGF5YnJlYWsg
Qmx1ZSBlbmFibGVkIHRvIGdlbmVyYXRlIHBlZXItcmV2aWV3LWxpa2UgcmVwb3J0IHRvCnBpbnBv
aW50IHBvdGVudGlhbCBzZWN1cml0eSBpc3N1ZXMgcmVnYXJkaW5nIHRoZSBwYXRjaGVzLiBJIG1h
bnVhbGx5CnJldmlld2VkIGFuZCB2YWxpZGF0ZWQgZWFjaCBjaGFuZ2UsIGluY2x1ZGluZyB0aGUg
QUktYXNzaXN0ZWQgY2hhbmdlcy4KSSBhbHNvIG1hbnVhbGx5IHRlc3RlZCBlYWNoIGNoYW5nZSBv
biB0aGUgaGFyZHdhcmUgYXMgZGVzY3JpYmVkIGFib3ZlLgoKVsOtdG9yIEh1Z28gU2lsdmEgKDE5
KToKICByaXNjdjogUHJlcGFyZSBFU1AzMi1QNCBlYXJseSBDTElDIHRyYXAgdmVjdG9ycwogIHJp
c2N2OiBIYW5kbGUgRVNQMzItUDQgQ0xJQyB0cmFwIGNvbnRleHQKICBkdC1iaW5kaW5nczogaW50
ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBFc3ByZXNzaWYgRVNQMzItUDQgQ0xJQwogIGlycWNoaXA6
IEFkZCBFc3ByZXNzaWYgRVNQMzItUDQgQ0xJQyBzdXBwb3J0CiAgZHQtYmluZGluZ3M6IGludGVy
cnVwdC1jb250cm9sbGVyOiBBZGQgRXNwcmVzc2lmIEVTUDMyLVA0IGludGVycnVwdAogICAgbWF0
cml4CiAgaXJxY2hpcDogQWRkIEVzcHJlc3NpZiBFU1AzMi1QNCBpbnRlcnJ1cHQgbWF0cml4IHN1
cHBvcnQKICBkdC1iaW5kaW5nczogdGltZXI6IEFkZCBFc3ByZXNzaWYgRVNQMzItUDQgQ0xJTlQK
ICBjbG9ja3NvdXJjZS9kcml2ZXJzL3RpbWVyLWNsaW50OiBBZGQgRXNwcmVzc2lmIEVTUDMyLVA0
IHN1cHBvcnQKICBkdC1iaW5kaW5nczogc2VyaWFsOiBBZGQgRXNwcmVzc2lmIEVTUDMyLVA0IFVB
UlQKICBzZXJpYWw6IGVzcDMyOiBSZXN0b3JlIHRoZSBFU1AzMiBVQVJUIGRyaXZlcgogIHNlcmlh
bDogZXNwMzI6IEFkZCBzdXBwb3J0IGZvciB0aGUgRVNQMzItUDQgVUFSVAogIHNlcmlhbDogZXNw
MzI6IFJlYXJtIFRYIGludGVycnVwdHMgd2hlbiB0aGUgRklGTyBpcyBmdWxsCiAgc2VyaWFsOiBl
c3AzMjogQWRkIGVhcmx5IGNvbnNvbGUgc3VwcG9ydCBmb3IgRVNQMzItUDQKICByaXNjdjogU3lu
Y2hyb25pemUgaW5zdHJ1Y3Rpb25zIHdyaXR0ZW4gdG8gRVNQMzItUDQgUFNSQU0KICByaXNjdjog
QWxpZ24gaW5pdCBkYXRhIHRvIHRoZSBFU1AzMi1QNCBQTVAgZ3JhbnVsYXJpdHkKICBkdC1iaW5k
aW5nczogcmlzY3Y6IEFkZCBXYXZlc2hhcmUgRVNQMzItUDQtTW9kdWxlLURFVi1LSVQKICBkdC1i
aW5kaW5nczogcmlzY3Y6IGNwdXM6IERvY3VtZW50IEVzcHJlc3NpZiBFU1AzMi1QNCBIUCBoYXJ0
cwogIHJpc2N2OiBkdHM6IEFkZCBXYXZlc2hhcmUgRVNQMzItUDQtTW9kdWxlLURFVi1LSVQKICBN
QUlOVEFJTkVSUzogQWRkIHRoZSBFc3ByZXNzaWYgRVNQMzItUDQgcGxhdGZvcm0KCiAuLi4vZXNw
LGVzcDMycDQtY2xpYy55YW1sICAgICAgICAgICAgICAgICAgICAgfCAgNTMgKwogLi4uL2VzcCxl
c3AzMnA0LWludG10eC55YW1sICAgICAgICAgICAgICAgICAgIHwgIDY3ICsrCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgICAgICAgfCAgMTcgKy0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2VzcHJlc3NpZi55YW1sICB8ICAyMiArCiAuLi4vYmluZGluZ3Mv
c2VyaWFsL2VzcCxlc3AzMi11YXJ0LnlhbWwgICAgICAgfCAgIDQgKy0KIC4uLi9iaW5kaW5ncy90
aW1lci9zaWZpdmUsY2xpbnQueWFtbCAgICAgICAgICB8ICAyOCArCiBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKwogYXJjaC9yaXNjdi9LY29uZmln
LnNvY3MgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vz
cHJlc3NpZi9NYWtlZmlsZSAgICAgICAgfCAgIDIgKwogLi4uL2VzcDMycDQtd2F2ZXNoYXJlLW1v
ZHVsZS1kZXYta2l0LmR0cyAgICAgIHwgIDQ2ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVz
c2lmL2VzcDMycDQuZHRzaSAgICB8ICA2NCArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20t
cHJvdG90eXBlcy5oICAgICAgIHwgICA0ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVm
bHVzaC5oICAgICAgICAgICB8ICAgNiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5o
ICAgICAgICAgICAgICAgfCAgIDQgKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAg
ICAgICAgICAgICAgIHwgICAzICsKIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAg
ICAgICAgICAgICB8ICA2NyArKwogYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEzICsKIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgICAgICAgICAgICAg
ICAgICAgICB8IDEzMiArKy0KIGFyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jICAgICAgICAgICAg
ICAgICAgICB8ICAgNiArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAg
ICAgICAgIHwgICA0ICsKIGFyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgubGRzLlMgICAgICAgICAg
ICAgICB8ICAgNCArCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMgICAgICAgICAg
ICAgfCAgNTcgKy0KIGRyaXZlcnMvaXJxY2hpcC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArCiBkcml2ZXJzL2lycWNoaXAvaXJxLWVzcDMycDQtY2xpYy5jICAgICAgICAgICAg
fCAxNzggKysrKwogZHJpdmVycy9pcnFjaGlwL2lycS1lc3AzMnA0LWludG10eC5jICAgICAgICAg
IHwgMTM5ICsrKwogZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgIDE1ICsKIGRyaXZlcnMvdHR5L3NlcmlhbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jICAgICAgICAgICAgICAgfCA5
NDAgKysrKysrKysrKysrKysrKysrCiBmcy9iaW5mbXRfZmxhdC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0KIGZzL2V4ZWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxMCArLQogaW5jbHVkZS9saW51eC9jYWNoZWZsdXNoLmggICAgICAgICAg
ICAgICAgICAgIHwgICA3ICsKIDMyIGZpbGVzIGNoYW5nZWQsIDE5MTAgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2VzcCxlc3AzMnA0LWNsaWMueWFtbAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9lc3AsZXNwMzJwNC1pbnRtdHgueWFtbAogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3ByZXNzaWYueWFt
bAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvZXNwcmVzc2lmL01ha2Vm
aWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9lc3ByZXNzaWYvZXNw
MzJwNC13YXZlc2hhcmUtbW9kdWxlLWRldi1raXQuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9ib290L2R0cy9lc3ByZXNzaWYvZXNwMzJwNC5kdHNpCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9pcnFjaGlwL2lycS1lc3AzMnA0LWNsaWMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaXJxY2hpcC9pcnEtZXNwMzJwNC1pbnRtdHguYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKCgpiYXNlLWNvbW1pdDogYWViYjcyNzQ0
NzY0MDMwNDBkNTgyYzYxNDc4ZGY4ZjRhN2JmOWNkMwotLSAKMi41Ni4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
