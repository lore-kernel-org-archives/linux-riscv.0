Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7326C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=De7WPK77gWPzSPpSaBrATWvjND6nGPEA3Kl/4a2Wvuw=; b=Rr9MBkfwax+ZzpGaeESlccOVrt
	aqZ7y1Ilq5G47RhmXN8KaWiQHs4zhr/6Ke1IGlxBxTMEvjk8u3pvC9AJIbwwTqZ0bu1v+imH9zaio
	4dscS/sOx8pGhYKlXqjeab0Qju6TLE0MukSu9p4VVdhhCsW7i/BEq0ebT5+dZa43Q9WTq9At057Lp
	vckJMgRxSlI7uJrje1+ArPwNSK36+dpNZxbUrY6Uerp8kybWP49sAQavHitWS0VuWaOS+p/re0vL6
	ti8WxO6p65/Sx6dRFPIxbqDYiH+bkjNrpRvSIhQJiFqiJjj17Bp4W8Q5B0jtNiNeEi0nX5vlzlNB1
	MZfXI8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNxuC-00000000keh-2t5X;
	Sun, 30 Jun 2024 17:00:00 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNxuA-00000000ke7-0N79
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jun 2024 16:59:59 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cd80e55efso3680036e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719766795; x=1720371595; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yePVxzlaLY/CDzvSJBrS9FZW4Bexi4/XiAKeEW5l+t0=;
        b=WTy1RqSCffqK4nys0yyxU8iqDXSYh47VTlv+ih6uJzojRHDVjmalde2usRJAr2HWW+
         8PG/6+TKw3o3eNYz/efGwJvdjQETBOB7AmtNSTXnreHFAmlu8JRJP487QyadrVNOeFRE
         O7B20xKBY68clbi7dfTR63PcGTODdtYKDpcCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719766795; x=1720371595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yePVxzlaLY/CDzvSJBrS9FZW4Bexi4/XiAKeEW5l+t0=;
        b=i6gir17Q+xaWjROi6fJUkFPQEF/rNFnyZ6o32yIt/tceCC2Kif/38aZI356uHlGiAW
         k+0FizMdwB4lRbPjvKU8NdvP3/7sD93arQeLNvkkRDgaJpArpq4vaeez2VxyDzAzbVae
         2Z0aka68kiw0bS/j21tmOCZ7fZKJag2jA3NUYJAZYyePuYW+L/PLSsZ7smlpURDg40a7
         NHr8bcse7s+8ru4E0PDTNQqAH34iTkWj2JLAkLUO0qnVjGF5Jr9+wqpaU+/h6y7801G8
         OZhcxWK+ODZrLuhFJRy7iVEhboJjKq0gnUEnvAgVHpSPovozmPC1jqCTVDxDQeOcrhUw
         3NEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSu22YtUwgP+MigCwCao0WVxSdJPWrfVlLM8tazDUM2m1WWG6Ann97ce2q033gD1EH5kjTXT8drUqoquX5t2pE9pA2al1m6iMXyNyghH+M
X-Gm-Message-State: AOJu0YwQhUsTvFBedDZ5ZOYXuTqBghr+11Snsi8PJI81iWtTjzYfcm0d
	i3QaDUv/qYr+JUevQabBscJ8bfpXCw6q8giUo5DoGbJ0B4q053IzRsNNGHDsOflAyy+sFFiTR84
	WLx0=
X-Google-Smtp-Source: AGHT+IHztThQMUjEQPzOVWF3b4oG//zIHh24QqUbDkFUnbCmnB12KcmGVNqiYZ1VKv69NwkHvWmqBA==
X-Received: by 2002:a2e:a4d8:0:b0:2ec:efb:8b60 with SMTP id 38308e7fff4ca-2ee5e39382dmr27024521fa.13.1719766795071;
        Sun, 30 Jun 2024 09:59:55 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168c7c7sm9963021fa.111.2024.06.30.09.59.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 09:59:53 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e7d2278d8so2944545e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 09:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW3SmaR5gMdvgreIE8oIoGeZDuojwdNy2LDTtpgwC6h6gSB2a10RZC8/FCXkit+n8OseFwImNKQQtXF+WKY26JgSqjWb06kxz/Sn50oAGz
X-Received: by 2002:a05:6512:114b:b0:52c:8075:4f3 with SMTP id
 2adb3069b0e04-52e82687e84mr2895260e87.36.1719766793292; Sun, 30 Jun 2024
 09:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240625040500.1788-1-jszhang@kernel.org> <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
In-Reply-To: <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Jun 2024 09:59:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
Message-ID: <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d0c533061c1e689a"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_095958_514588_46D87590 
X-CRM114-Status: GOOD (  37.71  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--000000000000d0c533061c1e689a
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jun 2024 at 11:12, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But yes, it would be lovely if we did things as "implement the
> low-level accessor functions and we'll wrap them for the generic case"
> rather than have every architecture have to do the wrapping..

Btw, to do that _well_, we need to expand on the user access functions
a bit more.

In particular, we can already implement "get_user()" on top of
user_access_begin() and friends something like this:

  #define get_user(x,ptr) ({                                    \
        __label__ Efault_read;                                  \
        long __err;                                             \
        __typeof__(ptr) __ptr = (ptr);                          \
        if (likely(user_access_begin(__ptr, sizeof(x)))) {      \
                unsafe_get_user(x, __ptr, Efault_read);         \
                user_access_end();                              \
                __err = 0;                                      \
        } else {                                                \
                if (0) {                                        \
Efault_read:            user_access_end();                      \
                }                                               \
                x = (__typeof__(x))0;                           \
                __err = -EFAULT;                                \
        }                                                       \
        __err; })

and it doesn't generate _horrible_ code. It looks pretty bad, but all
the error handling goes out-of-line, so on x86-64 (without debug
options) it generates code something like this:

        test   %rdi,%rdi
        js     <cap_validate_magic+0x98>
        stac
        lfence
        mov    (%rdi),%ecx
        clac

which is certainly not horrid. But it's not great, because that lfence
ends up really screwing up the pipeline.

The manually coded out-of-line code generates this instead:

        mov    %rax,%rdx
        sar    $0x3f,%rdx
        or     %rdx,%rax
        stac
        movzbl (%rax),%edx
        xor    %eax,%eax
        clac
        ret

because it doesn't do a conditional branch (with the required spectre
thing), but instead does the address as a data dependency and knows
that "all bits set" if the address was negative will cause a page
fault.

But we *can* get the user accesses to do the same with a slight
expansion of user_access_begin():

        stac
        mov    %rdi,%rax
        sar    $0x3f,%rax
        or     %rdi,%rax
        mov    (%rax),%eax
        clac

by just introducing a notion of "masked_user_access". The get_user()
macro part would look like this:

        __typeof__(ptr) __ptr;                                  \
        __ptr = masked_user_access_begin(ptr);                  \
        if (1) {                                                \
                unsafe_get_user(x, __ptr, Efault_read);         \
                user_access_end();                              \

and the patch to implement this is attached. I've had it around for a
while, but I don't know how many architectures can do this.

Note this part of the commit message:

  This model only works for dense accesses that start at 'src' and on
  architectures that have a guard region that is guaranteed to fault in
  between the user space and the kernel space area.

which is true on x86-64, but that "guard region" thing might not be
true everywhere.

Will/Catalin - would that

        src = masked_user_access_begin(src);

work on arm64? The code does do something like that with
__uaccess_mask_ptr() already, but at least currently it doesn't do the
"avoid conditional entirely", the masking is just in _addition_ to the
access_ok().

                 Linus

--000000000000d0c533061c1e689a
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ly1sl4ej0>
X-Attachment-Id: f_ly1sl4ej0

RnJvbSA2YjJjOWE2OWVmYzIxYjllNmUwNDk3YTU2NjEyNzNmNmZiZTIwNGIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IE1vbiwgOCBBcHIgMjAyNCAyMDowNDo1OCAtMDcwMApTdWJqZWN0OiBb
UEFUQ0hdIHg4Njogc3VwcG9ydCB1c2VyIGFkZHJlc3MgbWFza2luZyBpbnN0ZWFkIG9mIG5vbi1z
cGVjdWxhdGl2ZQogY29uZGl0aW9uYWwKClRoZSBTcGVjdHJlLXYxIG1pdGlnYXRpb25zIG1hZGUg
ImFjY2Vzc19vaygpIiBtdWNoIG1vcmUgZXhwZW5zaXZlLCBzaW5jZQppdCBoYXMgdG8gc2VyaWFs
aXplIGV4ZWN1dGlvbiB3aXRoIHRoZSB0ZXN0IGZvciBhIHZhbGlkIHVzZXIgYWRkcmVzcy4KCkFs
bCB0aGUgbm9ybWFsIHVzZXIgY29weSByb3V0aW5lcyBhdm9pZCB0aGlzIGJ5IGp1c3QgbWFza2lu
ZyB0aGUgdXNlcgphZGRyZXNzIHdpdGggYSBkYXRhLWRlcGVuZGVudCBtYXNrIGluc3RlYWQsIGJ1
dCB0aGUgZmFzdAoidW5zYWZlX3VzZXJfcmVhZCgpIiBraW5kIG9mIHBhdHRlcm1zIHRoYXQgd2Vy
ZSBzdXBwb3NlZCB0byBiZSBhIGZhc3QKY2FzZSBnb3Qgc2xvd2VkIGRvd24uCgpUaGlzIGludHJv
ZHVjZXMgYSBub3Rpb24gb2YgdXNpbmcKCglzcmMgPSBtYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4o
c3JjKTsKCnRvIGRvIHRoZSB1c2VyIGFkZHJlc3Mgc2FuaXR5IHVzaW5nIGEgZGF0YS1kZXBlbmRl
bnQgbWFzayBpbnN0ZWFkIG9mIHRoZQptb3JlIHRyYWRpdGlvbmFsIGNvbmRpdGlvbmFsCgoJaWYg
KHVzZXJfcmVhZF9hY2Nlc3NfYmVnaW4oc3JjLCBsZW4pKSB7Cgptb2RlbC4KClRoaXMgbW9kZWwg
b25seSB3b3JrcyBmb3IgZGVuc2UgYWNjZXNzZXMgdGhhdCBzdGFydCBhdCAnc3JjJyBhbmQgb24K
YXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgYSBndWFyZCByZWdpb24gdGhhdCBpcyBndWFyYW50ZWVk
IHRvIGZhdWx0IGluCmJldHdlZW4gdGhlIHVzZXIgc3BhY2UgYW5kIHRoZSBrZXJuZWwgc3BhY2Ug
YXJlYS4KCldpdGggdGhpcywgdGhlIHVzZXIgYWNjZXNzIGRvZXNuJ3QgbmVlZCB0byBiZSBtYW51
YWxseSBjaGVja2VkLCBiZWNhdXNlCmEgYmFkIGFkZHJlc3MgaXMgZ3VhcmFudGVlZCB0byBmYXVs
dCAoYnkgc29tZSBhcmNoaXRlY3R1cmUgbWFza2luZwp0cmljazogb24geDg2LTY0IHRoaXMgaW52
b2x2ZXMganVzdCB0dXJuaW5nIGFuIGludmFsaWQgdXNlciBhZGRyZXNzIGludG8KYWxsIG9uZXMs
IHNpbmNlIHdlIGRvbid0IG1hcCB0aGUgdG9wIG9mIGFkZHJlc3Mgc3BhY2UpLgoKVGhpcyBvbmx5
IGNvbnZlcnRzIGEgY291cGxlIG9mIGV4YW1wbGVzIGZvciBub3cuICBFeGFtcGxlIHg4Ni02NCBj
b2RlCmdlbmVyYXRpb24gZm9yIGxvYWRpbmcgdHdvIHdvcmRzIGZyb20gdXNlciBzcGFjZToKCiAg
ICAgICAgc3RhYwogICAgICAgIG1vdiAgICAlcmF4LCVyY3gKICAgICAgICBzYXIgICAgJDB4M2Ys
JXJjeAogICAgICAgIG9yICAgICAlcmF4LCVyY3gKICAgICAgICBtb3YgICAgKCVyY3gpLCVyMTMK
ICAgICAgICBtb3YgICAgMHg4KCVyY3gpLCVyMTQKICAgICAgICBjbGFjCgp3aGVyZSBhbGwgdGhl
IGVycm9yIGhhbmRsaW5nIGFuZCAtRUZBVUxUIGlzIG5vdyBwdXJlbHkgaGFuZGxlZCBvdXQgb2YK
bGluZSBieSB0aGUgZXhjZXB0aW9uIHBhdGguCgpPZiBjb3Vyc2UsIGlmIHRoZSBtaWNyby1hcmNo
aXRlY3R1cmUgZG9lcyBiYWRseSBhdCAnY2xhYycgYW5kICdzdGFjJywKdGhlIGFib3ZlIGlzIHN0
aWxsIHBpdGlmdWxseSBzbG93LiAgQnV0IGF0IGxlYXN0IHdlIGRpZCBhcyB3ZWxsIGFzIHdlCmNv
dWxkLgoKU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCB8IDggKysr
KysrKysKIGZzL3NlbGVjdC5jICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrLQogaW5jbHVk
ZS9saW51eC91YWNjZXNzLmggICAgICAgICAgIHwgNyArKysrKysrCiBsaWIvc3RybmNweV9mcm9t
X3VzZXIuYyAgICAgICAgICAgfCA5ICsrKysrKysrKwogbGliL3N0cm5sZW5fdXNlci5jICAgICAg
ICAgICAgICAgIHwgOSArKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nl
c3NfNjQuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaAppbmRleCAwNDc4OWY0
NWFiMmIuLmExMDE0OWE5NmQ5ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFj
Y2Vzc182NC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaApAQCAtNTMs
NiArNTMsMTQgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9fdW50YWdnZWRfYWRkcl9y
ZW1vdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAgKi8KICNkZWZpbmUgdmFsaWRfdXNlcl9hZGRy
ZXNzKHgpICgoX19mb3JjZSBsb25nKSh4KSA+PSAwKQogCisvKgorICogTWFza2luZyB0aGUgdXNl
ciBhZGRyZXNzIGlzIGFuIGFsdGVybmF0aXZlIHRvIGEgY29uZGl0aW9uYWwKKyAqIHVzZXJfYWNj
ZXNzX2JlZ2luIHRoYXQgY2FuIGF2b2lkIHRoZSBmZW5jaW5nLiBUaGlzIG9ubHkgd29ya3MKKyAq
IGZvciBkZW5zZSBhY2Nlc3NlcyBzdGFydGluZyBhdCB0aGUgYWRkcmVzcy4KKyAqLworI2RlZmlu
ZSBtYXNrX3VzZXJfYWRkcmVzcyh4KSAoKHR5cGVvZih4KSkoKGxvbmcpKHgpfCgobG9uZykoeCk+
PjYzKSkpCisjZGVmaW5lIG1hc2tlZF91c2VyX2FjY2Vzc19iZWdpbih4KSAoeyBfX3VhY2Nlc3Nf
YmVnaW4oKTsgbWFza191c2VyX2FkZHJlc3MoeCk7IH0pCisKIC8qCiAgKiBVc2VyIHBvaW50ZXJz
IGNhbiBoYXZlIHRhZyBiaXRzIG9uIHg4Ni02NC4gIFRoaXMgc2NoZW1lIHRvbGVyYXRlcwogICog
YXJiaXRyYXJ5IHZhbHVlcyBpbiB0aG9zZSBiaXRzIHJhdGhlciB0aGVuIG1hc2tpbmcgdGhlbSBv
ZmYuCmRpZmYgLS1naXQgYS9mcy9zZWxlY3QuYyBiL2ZzL3NlbGVjdC5jCmluZGV4IDk1MTVjM2Zh
MWEwMy4uYmMxODVkMTExNDM2IDEwMDY0NAotLS0gYS9mcy9zZWxlY3QuYworKysgYi9mcy9zZWxl
Y3QuYwpAQCAtNzgwLDcgKzc4MCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGdldF9zaWdzZXRfYXJn
cGFjayhzdHJ1Y3Qgc2lnc2V0X2FyZ3BhY2sgKnRvLAogewogCS8vIHRoZSBwYXRoIGlzIGhvdCBl
bm91Z2ggZm9yIG92ZXJoZWFkIG9mIGNvcHlfZnJvbV91c2VyKCkgdG8gbWF0dGVyCiAJaWYgKGZy
b20pIHsKLQkJaWYgKCF1c2VyX3JlYWRfYWNjZXNzX2JlZ2luKGZyb20sIHNpemVvZigqZnJvbSkp
KQorCQlpZiAoY2FuX2RvX21hc2tlZF91c2VyX2FjY2VzcygpKQorCQkJZnJvbSA9IG1hc2tlZF91
c2VyX2FjY2Vzc19iZWdpbihmcm9tKTsKKwkJZWxzZSBpZiAoIXVzZXJfcmVhZF9hY2Nlc3NfYmVn
aW4oZnJvbSwgc2l6ZW9mKCpmcm9tKSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAkJdW5zYWZlX2dl
dF91c2VyKHRvLT5wLCAmZnJvbS0+cCwgRWZhdWx0KTsKIAkJdW5zYWZlX2dldF91c2VyKHRvLT5z
aXplLCAmZnJvbS0+c2l6ZSwgRWZhdWx0KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdWFj
Y2Vzcy5oIGIvaW5jbHVkZS9saW51eC91YWNjZXNzLmgKaW5kZXggMzA2NDMxNGY0ODMyLi5mMTgz
NzFmNmNmMzYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oCisrKyBiL2luY2x1
ZGUvbGludXgvdWFjY2Vzcy5oCkBAIC0zMiw2ICszMiwxMyBAQAogfSkKICNlbmRpZgogCisjaWZk
ZWYgbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luCisgI2RlZmluZSBjYW5fZG9fbWFza2VkX3VzZXJf
YWNjZXNzKCkgMQorI2Vsc2UKKyAjZGVmaW5lIGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSAw
CisgI2RlZmluZSBtYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oc3JjKSBOVUxMCisjZW5kaWYKKwog
LyoKICAqIEFyY2hpdGVjdHVyZXMgc2hvdWxkIHByb3ZpZGUgdHdvIHByaW1pdGl2ZXMgKHJhd19j
b3B5X3t0byxmcm9tfV91c2VyKCkpCiAgKiBhbmQgZ2V0IHJpZCBvZiB0aGVpciBwcml2YXRlIGlu
c3RhbmNlcyBvZiBjb3B5X3t0byxmcm9tfV91c2VyKCkgYW5kCmRpZmYgLS1naXQgYS9saWIvc3Ry
bmNweV9mcm9tX3VzZXIuYyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCmluZGV4IDY0MzJiOGMz
ZTQzMS4uOTg5YTEyYTY3ODcyIDEwMDY0NAotLS0gYS9saWIvc3RybmNweV9mcm9tX3VzZXIuYwor
KysgYi9saWIvc3RybmNweV9mcm9tX3VzZXIuYwpAQCAtMTIwLDYgKzEyMCwxNSBAQCBsb25nIHN0
cm5jcHlfZnJvbV91c2VyKGNoYXIgKmRzdCwgY29uc3QgY2hhciBfX3VzZXIgKnNyYywgbG9uZyBj
b3VudCkKIAlpZiAodW5saWtlbHkoY291bnQgPD0gMCkpCiAJCXJldHVybiAwOwogCisJaWYgKGNh
bl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSkgeworCQlsb25nIHJldHZhbDsKKworCQlzcmMgPSBt
YXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oc3JjKTsKKwkJcmV0dmFsID0gZG9fc3RybmNweV9mcm9t
X3VzZXIoZHN0LCBzcmMsIGNvdW50LCBjb3VudCk7CisJCXVzZXJfcmVhZF9hY2Nlc3NfZW5kKCk7
CisJCXJldHVybiByZXR2YWw7CisJfQorCiAJbWF4X2FkZHIgPSBUQVNLX1NJWkVfTUFYOwogCXNy
Y19hZGRyID0gKHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihzcmMpOwogCWlmIChsaWtlbHko
c3JjX2FkZHIgPCBtYXhfYWRkcikpIHsKZGlmZiAtLWdpdCBhL2xpYi9zdHJubGVuX3VzZXIuYyBi
L2xpYi9zdHJubGVuX3VzZXIuYwppbmRleCBmZWViOTM1YTIyOTkuLjZlNDg5ZjllOTBmMSAxMDA2
NDQKLS0tIGEvbGliL3N0cm5sZW5fdXNlci5jCisrKyBiL2xpYi9zdHJubGVuX3VzZXIuYwpAQCAt
OTYsNiArOTYsMTUgQEAgbG9uZyBzdHJubGVuX3VzZXIoY29uc3QgY2hhciBfX3VzZXIgKnN0ciwg
bG9uZyBjb3VudCkKIAlpZiAodW5saWtlbHkoY291bnQgPD0gMCkpCiAJCXJldHVybiAwOwogCisJ
aWYgKGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSkgeworCQlsb25nIHJldHZhbDsKKworCQlz
dHIgPSBtYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oc3RyKTsKKwkJcmV0dmFsID0gZG9fc3Rybmxl
bl91c2VyKHN0ciwgY291bnQsIGNvdW50KTsKKwkJdXNlcl9yZWFkX2FjY2Vzc19lbmQoKTsKKwkJ
cmV0dXJuIHJldHZhbDsKKwl9CisKIAltYXhfYWRkciA9IFRBU0tfU0laRV9NQVg7CiAJc3JjX2Fk
ZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHN0cik7CiAJaWYgKGxpa2VseShzcmNf
YWRkciA8IG1heF9hZGRyKSkgewo=
--000000000000d0c533061c1e689a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--000000000000d0c533061c1e689a--

