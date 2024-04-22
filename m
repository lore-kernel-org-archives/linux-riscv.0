Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4CAC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M260IDm1Wxgdgh5cIBDImq7aP8TDocHQPtmRCgruuzk=; b=pL/HyG8E0zT+h8
	HAhSiwsC7SOCi9ExUOrb8xj1VPsFOZx880QHq/2UKWvRldS3iiF1OgeMwW47TUSFg/3u8hH9fT1eF
	QjwFrUkmwHvDmqRVyBPUf1v/ZSSpnbauxL1fwRjf2UHXj9XquHBe08mJiSOPlXdni40HpsoX+hmg3
	bumQehBGID6AobMZb3P0V+NaehaFJMkYB5l0UNjCWtCfDmMJRClI3N8x5+Kuiud6UaIhV5n4e3rrk
	IiK0k8gZ+M65lkzXOOcNPtpvmCKUtp0ZzhVWJrA48pYIopYbVW+i77fbTyT9OWqrMj62ziS5z4ToM
	TRdoA533QFRk29F6S3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymDn-0000000C7FO-3lmz;
	Mon, 22 Apr 2024 05:28:07 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymDk-0000000C7Cp-1s4E
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:28:05 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7d5db134badso167386039f.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713763682; x=1714368482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPFOp2DnZ2SqsScIHARn1DLTXZkW+97s6tf/2J2vkiU=;
        b=e2i8ZWJyHYqhw3XBr+LJ/IQ0DlQ/YOAVhCpOInvJntyy2RDOZtKwj46GLcds5CNmpI
         30vRbDRBYj/m2yDhCj4lcBXzS638eY81d+mZ4UiRnhhiSveT3jUWcsC/ZjTIvGJ9Erne
         xxAlaHnQwicnF0hcvIhbysYnP2Y9b8iI/9Y8UZYCl9bKH3KaZKrTJaa4uyn8i2jn/0c/
         qpqq4QtJIfh90VJTwDVMNh7GUGOW8UIHpb0UMP4ynPzVl3BYkD5oa0WNLDa+pF6/smIQ
         dmubPL/TrAspZcs30XZo8diMjKm9pzxQ8ocrjdfM0Uepeu5r4AjBrOKDsm7jAIJNCMr6
         Kr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713763682; x=1714368482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPFOp2DnZ2SqsScIHARn1DLTXZkW+97s6tf/2J2vkiU=;
        b=Fb6P6veEwnUGhTQS2XEL2FNQLmw1P2GzTBzX2tcfefYDtKjfB0rMu2Ev9Tqgomdnur
         YNpposlU/0kqaYOU/u1Kuwrks8OO/QVhU403Gd3JkhicPjq0EgToyBYR6XEIRw4V9MJn
         JdHXoV1pWj6snogAIj8MLI1Z1pVXn3qM4Ez8OkMeK7CsaZrn2ujMLSXsMOLL5A/mW5Vq
         80BpNyLnDyiTXJhZO0CHcuWW3gKhRYxETd8yJlKPFepW7zamb9dXfnQ6lBYduVBKUF3f
         qv9S1QY6WeuhPTw6AHm3EYgWSNax/mOFWp9TPqzpTYeCOBzM5J6HC04eTHmR2V+RfFbF
         G8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUInPc2qChP6zgxXIVslmzj6YXpdv+Q/kc863nzjZp2kg/UgXgJQ8jwdtZKfKBtniQByHlQRjZnSt+ljfisB5ulMH45ryhTk43DMCsnjxZI
X-Gm-Message-State: AOJu0YwSlRTCdRPSs0M0YSFI3U9hjHReog0fgyPgAmQszBWDtaZWqLou
	/HmeWz2sqFwavmep5F0pe2FZMXX+LLNqhu7jIGU57HozfM1sr0IoBawF8FAP/9FzF3uFokw4Q4U
	cHnox9CaaKDF7VAIRV8iO9Vh/D+YSKWwqWihReQ==
X-Google-Smtp-Source: AGHT+IF2fN1BF/BA5zZpPH9awO2iybqu2/U//6hw9xuoA3CAPNDIqio5oxlctD7wg/x5fuL+ITh10xGQjApKCSUO04E=
X-Received: by 2002:a05:6e02:b26:b0:36a:3ef4:aa0a with SMTP id
 e6-20020a056e020b2600b0036a3ef4aa0amr12065915ilu.24.1713763682385; Sun, 21
 Apr 2024 22:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-18-atishp@rivosinc.com>
In-Reply-To: <20240420151741.962500-18-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:57:51 +0530
Message-ID: <CAAhSdy0KMApgSh4q1zxgv1AKrT44bSEL3+GaFbA8M1XL6UMoJw@mail.gmail.com>
Subject: Re: [PATCH v8 17/24] KVM: riscv: selftests: Move sbi definitions to
 its own header file
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_222804_509701_F5E92170 
X-CRM114-Status: GOOD (  17.00  )
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

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgZGVmaW5pdGlvbnMgd2lsbCBjb250aW51ZSB0
byBncm93LiBNb3ZlIHRoZSBzYmkgcmVsYXRlZAo+IGRlZmluaXRpb25zIHRvIGl0cyBvd24gaGVh
ZGVyIGZpbGUgZnJvbSBwcm9jZXNzb3IuaAo+Cj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0v
aW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCAgIHwgMzkgLS0tLS0tLS0tLS0tLS0tCj4gIC4uLi90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9zYmkuaCB8IDUwICsrKysrKysrKysr
KysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi91Y2FsbC5oICAgICAg
IHwgIDEgKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vc3RlYWxfdGltZS5jICAgICAg
fCAgNCArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2lu
Y2x1ZGUvcmlzY3Yvc2JpLmgKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gaW5kZXggY2U0NzNmZTI1MWRkLi4zYjlj
YjM5MzI3ZmYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
aW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IEBAIC0xNTQsNDUgKzE1NCw2IEBAIHZvaWQgdm1f
aW5zdGFsbF9pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZtICp2bSwgZXhjZXB0aW9uX2hh
bmRsZXJfZm4gaGFuZGxlCj4gICNkZWZpbmUgUEdUQkxfUEFHRV9TSVpFICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQR1RCTF9MMF9CTE9DS19TSVpFCj4gICNkZWZpbmUgUEdUQkxfUEFH
RV9TSVpFX1NISUZUICAgICAgICAgICAgICAgICAgUEdUQkxfTDBfQkxPQ0tfU0hJRlQKPgo+IC0v
KiBTQkkgcmV0dXJuIGVycm9yIGNvZGVzICovCj4gLSNkZWZpbmUgU0JJX1NVQ0NFU1MgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMAo+IC0jZGVmaW5lIFNCSV9FUlJfRkFJTFVSRSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLTEKPiAtI2RlZmluZSBTQklfRVJSX05PVF9TVVBQT1JU
RUQgICAgICAgICAgICAgICAgICAtMgo+IC0jZGVmaW5lIFNCSV9FUlJfSU5WQUxJRF9QQVJBTSAg
ICAgICAgICAgICAgICAgIC0zCj4gLSNkZWZpbmUgU0JJX0VSUl9ERU5JRUQgICAgICAgICAgICAg
ICAgICAgICAgICAgLTQKPiAtI2RlZmluZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUyAgICAgICAg
ICAgICAgICAgICAgICAgIC01Cj4gLSNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX0FWQUlMQUJMRSAg
ICAgICAgICAgICAgLTYKPiAtI2RlZmluZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCAgICAgICAg
ICAgICAgICAgICAgICAgIC03Cj4gLSNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgICAg
ICAgICAgICAgICAgICAgICAgICAtOAo+IC0KPiAtI2RlZmluZSBTQklfRVhUX0VYUEVSSU1FTlRB
TF9TVEFSVCAgICAgICAgICAgICAweDA4MDAwMDAwCj4gLSNkZWZpbmUgU0JJX0VYVF9FWFBFUklN
RU5UQUxfRU5EICAgICAgICAgICAgICAgMHgwOEZGRkZGRgo+IC0KPiAtI2RlZmluZSBLVk1fUklT
Q1ZfU0VMRlRFU1RTX1NCSV9FWFQgICAgICAgICAgICBTQklfRVhUX0VYUEVSSU1FTlRBTF9FTkQK
PiAtI2RlZmluZSBLVk1fUklTQ1ZfU0VMRlRFU1RTX1NCSV9VQ0FMTCAgICAgICAgICAwCj4gLSNk
ZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfVU5FWFAgICAgICAgICAgMQo+IC0KPiAtZW51
bSBzYmlfZXh0X2lkIHsKPiAtICAgICAgIFNCSV9FWFRfQkFTRSA9IDB4MTAsCj4gLSAgICAgICBT
QklfRVhUX1NUQSA9IDB4NTM1NDQxLAo+IC19Owo+IC0KPiAtZW51bSBzYmlfZXh0X2Jhc2VfZmlk
IHsKPiAtICAgICAgIFNCSV9FWFRfQkFTRV9QUk9CRV9FWFQgPSAzLAo+IC19Owo+IC0KPiAtc3Ry
dWN0IHNiaXJldCB7Cj4gLSAgICAgICBsb25nIGVycm9yOwo+IC0gICAgICAgbG9uZyB2YWx1ZTsK
PiAtfTsKPiAtCj4gLXN0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVu
c2lnbmVkIGxvbmcgYXJnMCwKPiAtICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGFyZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKPiAtICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFyZzUpOwo+IC0KPiAtYm9vbCBndWVzdF9zYmlfcHJvYmVfZXh0
ZW5zaW9uKGludCBleHRpZCwgbG9uZyAqb3V0X3ZhbCk7Cj4gLQo+ICBzdGF0aWMgaW5saW5lIHZv
aWQgbG9jYWxfaXJxX2VuYWJsZSh2b2lkKQo+ICB7Cj4gICAgICAgICBjc3Jfc2V0KENTUl9TU1RB
VFVTLCBTUl9TSUUpOwo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
aW5jbHVkZS9yaXNjdi9zYmkuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3Jpc2N2L3NiaS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmJhMDRmMmRlYzdiNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9zYmkuaAo+IEBAIC0wLDAgKzEsNTAgQEAKPiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiArLyoKPiArICogUklTQy1WIFNCSSBz
cGVjaWZpYyBkZWZpbml0aW9ucwo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgUml2b3Mg
SW5jLgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgU0VMRlRFU1RfS1ZNX1NCSV9ICj4gKyNkZWZpbmUg
U0VMRlRFU1RfS1ZNX1NCSV9ICj4gKwo+ICsvKiBTQkkgcmV0dXJuIGVycm9yIGNvZGVzICovCj4g
KyNkZWZpbmUgU0JJX1NVQ0NFU1MgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAKPiArI2Rl
ZmluZSBTQklfRVJSX0ZBSUxVUkUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0xCj4g
KyNkZWZpbmUgU0JJX0VSUl9OT1RfU1VQUE9SVEVEICAgICAgICAgICAgICAgICAgLTIKPiArI2Rl
ZmluZSBTQklfRVJSX0lOVkFMSURfUEFSQU0gICAgICAgICAgICAgICAgICAtMwo+ICsjZGVmaW5l
IFNCSV9FUlJfREVOSUVEICAgICAgICAgICAgICAgICAgICAgICAgIC00Cj4gKyNkZWZpbmUgU0JJ
X0VSUl9JTlZBTElEX0FERFJFU1MgICAgICAgICAgICAgICAgICAgICAgICAtNQo+ICsjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9BVkFJTEFCTEUgICAgICAgICAgICAgIC02Cj4gKyNkZWZpbmUgU0JJ
X0VSUl9BTFJFQURZX1NUQVJURUQgICAgICAgICAgICAgICAgICAgICAgICAtNwo+ICsjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEICAgICAgICAgICAgICAgICAgICAgICAgLTgKPiArCj4g
KyNkZWZpbmUgU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgICAgICAgICAgICAgMHgwODAwMDAw
MAo+ICsjZGVmaW5lIFNCSV9FWFRfRVhQRVJJTUVOVEFMX0VORCAgICAgICAgICAgICAgIDB4MDhG
RkZGRkYKPiArCj4gKyNkZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfRVhUICAgICAgICAg
ICAgU0JJX0VYVF9FWFBFUklNRU5UQUxfRU5ECj4gKyNkZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNU
U19TQklfVUNBTEwgICAgICAgICAgMAo+ICsjZGVmaW5lIEtWTV9SSVNDVl9TRUxGVEVTVFNfU0JJ
X1VORVhQICAgICAgICAgIDEKPiArCj4gK2VudW0gc2JpX2V4dF9pZCB7Cj4gKyAgICAgICBTQklf
RVhUX0JBU0UgPSAweDEwLAo+ICsgICAgICAgU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKPiArfTsK
PiArCj4gK2VudW0gc2JpX2V4dF9iYXNlX2ZpZCB7Cj4gKyAgICAgICBTQklfRVhUX0JBU0VfUFJP
QkVfRVhUID0gMywKPiArfTsKPiArCj4gK3N0cnVjdCBzYmlyZXQgewo+ICsgICAgICAgbG9uZyBl
cnJvcjsKPiArICAgICAgIGxvbmcgdmFsdWU7Cj4gK307Cj4gKwo+ICtzdHJ1Y3Qgc2JpcmV0IHNi
aV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmcxLCB1bnNpZ25lZCBsb25nIGFyZzIsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmczLCB1bnNpZ25lZCBsb25n
IGFyZzQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc1KTsKPiAr
Cj4gK2Jvb2wgZ3Vlc3Rfc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0aWQsIGxvbmcgKm91dF92
YWwpOwo+ICsKPiArI2VuZGlmIC8qIFNFTEZURVNUX0tWTV9TQklfSCAqLwo+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi91Y2FsbC5oIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvdWNhbGwuaAo+IGluZGV4IGJl
NDZlYjMyZWMyNy4uYTY5NWFlMzZmM2UwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3VjYWxsLmgKPiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi91Y2FsbC5oCj4gQEAgLTMsNiArMyw3IEBACj4gICNk
ZWZpbmUgU0VMRlRFU1RfS1ZNX1VDQUxMX0gKPgo+ICAjaW5jbHVkZSAicHJvY2Vzc29yLmgiCj4g
KyNpbmNsdWRlICJzYmkuaCIKPgo+ICAjZGVmaW5lIFVDQUxMX0VYSVRfUkVBU09OICAgICAgIEtW
TV9FWElUX1JJU0NWX1NCSQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9zdGVhbF90aW1lLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vc3RlYWxfdGlt
ZS5jCj4gaW5kZXggYmFlMGM1MDI2ZjgyLi4yZmY4MmM3ZmQ5MjYgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3N0ZWFsX3RpbWUuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9zdGVhbF90aW1lLmMKPiBAQCAtMTEsNyArMTEsOSBAQAo+ICAjaW5j
bHVkZSA8cHRocmVhZC5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRl
IDxhc20va3ZtLmg+Cj4gLSNpZm5kZWYgX19yaXNjdgo+ICsjaWZkZWYgX19yaXNjdgo+ICsjaW5j
bHVkZSAic2JpLmgiCj4gKyNlbHNlCj4gICNpbmNsdWRlIDxhc20va3ZtX3BhcmEuaD4KPiAgI2Vu
ZGlmCj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
