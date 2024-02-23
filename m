Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C3C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tqp14FOAKDFZo/Tt/zyIBkWZD5PDGSBpF4CnRpQI8Do=; b=YDGOhX8HtuRnJK
	/1fiQ5XWOam+maEc7R1+s3Q1tFJA2jDlufC1GBKTQ18A3wuwy6XLeQVWq2T3wl5nXCYkZ/3kQO2fO
	7W2FOh0mvwc2G3gs/6YgDpHRyw4sQQ+1zrmFIIGbr8qVMbi3ZXKSyEQMkucczr2DDNQ2togltz1UA
	S3/+b13q/hLFZIjMBWIVmwlmBKYgxRuR96/2NeI2WAhPOqIuB23+JDWpp5i6qWtfrak1PBW+VK86I
	aDpnqolrBaBgROR1VLB2FPCD0sdQoDWv1lVhQoapuGgOhXt7WU3xIKOAnUISHbcckk8igmwRRocee
	jgKqK1H8PLTdOoL7i12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWie-00000009nKk-0RzT;
	Fri, 23 Feb 2024 14:40:08 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWiX-00000009nHu-1ODL
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 14:40:06 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso338363a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699200; x=1709304000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KymCeXAdOwhnbLLu7sHJyesb6UapRJI/5wmiDLXWjq8=;
        b=np8fhHDxvEufiS9LYb5U3pfhPyXCao/1wSbVuIsoUSlMrLbY2/TagoQ4GwjYJ5yitK
         6znoireEqAM/CTGdh/1NRSRp24pB5fQ0zGIuTGOCgEBDo2S6EpO0eF3aXLKwOOI0xT9d
         aJEpk5P+q7zRpIOLTtNyIRv8seeH/pd81qsSyRt/GnYrroqkQkTsXXrlzcNzZ9YqoYB4
         pEum0UDeXDgxQTrNLTkAdDgUNDxpuVm2dRaIM/6hrFPrzb2q6BgujKyMjWUL9HbYl6Uw
         /uXnxxTEACfEmv6yPLRoSbIqM2Hpb8DuE96DWmkErQg+FixeNWtAu0gL211xHP4g1r1r
         OVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699200; x=1709304000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KymCeXAdOwhnbLLu7sHJyesb6UapRJI/5wmiDLXWjq8=;
        b=RYhqQMA3kpzBVANvQEgdvKhMGQ8BWcqMqq12h3fHVA1eOhM5FLW9wXiI/ZijN481mi
         IpsyJ0DFTpNgvuaskLboAWYcIxrXYhreN5V6bZu/7tU2bj6UQonXQCvuFiST8PuyqGPa
         DtOoycuhOaUA/g8zYlXszJXDGyyqUjTzzi/GeFcqyni7Rq3BNAcPotZtAEKwXXpjvsJM
         T4WfJlBxFFFjQ8yaBv5kmrfmbr+vBLtTTAHkVO8ys8aD/iTpat3xYDDKPPAb0OufBvMZ
         bcenM6X+KBRylxI9CGk12p+bocWGSgt7EQQw0Gx4eQIT+8OTh6saM5pNLPFx7NiBDUor
         ozcA==
X-Gm-Message-State: AOJu0YzF14SBoaEAapzACDymu1sLDQ5QDx6vq5bsR5JWN0J6uEKopBzU
	L9ZjVLMuAFk5RsLw4//SlQQwzobxi1C8+O6mVnZpBw24Nua29wTnx86fcLSGfVqCs82K7UTNuc4
	8B3wRjR6y9zxtuH3YJLG3i/qtIxs=
X-Google-Smtp-Source: AGHT+IHwDwRlHf/VCvl3JY5KZpo2YjDUVeb5So1ID2OBba3Z4WVPb5UzKpoEEDoA/9Zp+8R5HJYMwh7wafY2OKOm9SM=
X-Received: by 2002:a05:6a21:3943:b0:1a0:5841:6756 with SMTP id
 ac3-20020a056a21394300b001a058416756mr81570pzc.4.1708699200297; Fri, 23 Feb
 2024 06:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
In-Reply-To: <20240223-employee-pessimism-03ba0b58db6b@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:39:47 +0100
Message-ID: <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_064004_965667_6B96B1DC 
X-CRM114-Status: GOOD (  10.01  )
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMjozOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgdGhlIHJlcXVpcmVkIGJpdHMgZnJvbSBydXN0LWZvci1s
aW51eCB0byBlbmFibGUgZ2VuZXJhdGluZyBhIFJJU0MtVgo+IHRhcmdldCBmb3IgcnVzdC4gVGhl
IHNjcmlwdCwgd3JpdHRlbiBieSBNaWd1ZWwsIHdhcyBvcmlnaW5hbGx5IGEKPiBjb25maWcgZmls
ZSBjb250cmlidXRlZCBieSBHYXJ5LgoKVGhhbmtzIGZvciB0aGlzIENvbm5vciEKCmFybTY0IGlz
IHNlbmRpbmcgdGhlc2UgZm9yIDYuOToKCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2FybTY0
L2MvZjgyODExZTIyYjQ4CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2FybTY0L2MvNzI0YTc1
YWM5NTQyCgpTbyBpdCB3b3VsZCBiZSBuaWNlIHRvIHNlZSBpZiBpdCBtYXkgYmUgYWxyZWFkeSBw
b3NzaWJsZSB0byBlbmFibGUgaXQKdmlhIGEgYnVpbHRpbiB0YXJnZXQgKyBmbGFncyBpbnN0ZWFk
IG9mIHRoZSBjdXN0b20gdGFyZ2V0LCBlLmcuIGFybTY0CmRvZXM6CgogICAgS0JVSUxEX1JVU1RG
TEFHUyArPSAtLXRhcmdldD1hYXJjaDY0LXVua25vd24tbm9uZSAtQ3RhcmdldC1mZWF0dXJlPSIt
bmVvbiIKCmFuZCBzbyBvbi4KCklmIGl0IGRvZXMgbm90IHdvcmssIGl0IHdvdWxkIGJlIGdvb2Qg
dG8ga25vdyB3aGF0IHdvdWxkIGJlIG5lZWRlZCBmb3IKUklTQy1WIGFuZCBwdXQgaXQgaW50byB0
aGUgdW5zdGFibGUgZmVhdHVyZXMgLyB3YW50ZWQgZmVhdHVyZXMgbGlzdApmb3IgUnVzdC4KCkVp
dGhlciB3YXksIGl0IGlzIG5vdCBhIGJsb2NrZXIgKGFsdGhvdWdoIHlvdSB3aWxsIG5lZWQgYSBy
ZWJhc2UgYWZ0ZXIKYXJtNjQgbGFuZHMgdG8gdXNlIHRoZSBgdGFyZ2V0Lmpzb25gIGluIHRoZSBy
aWdodCBwbGFjZXMpLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
