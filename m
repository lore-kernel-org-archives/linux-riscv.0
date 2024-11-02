Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BCAE677EE
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP0wHrejkONoI2zXEuul5pI3TcbF5K/2lvCg2iBnou8=; b=P13kZvrAQ5IvVSg8FLIZzTGWTg
	cKyTSZLpb2GZczeEBy4edfetfJOROG8OwSJnPcBsLp2/jBrIrp5gVk+MPJ853jgs6K4LXZZMOURkD
	Ly/6SXKTW3y2u99Xy15T9SL/3oLZDnoDmgEmMnuKYMWegcjyLUuR4R0jzT1KLFP6ueTgMWPVIXBD8
	AJhj0044GFgkmel7g0gA/385eLrIdGPaMKEsOl2citoDT8/LGho2ChEqYdC2P+1AVTvIuDES2cfWs
	1ppDeW7Xp4HQHIYF+MCXPzNxhpTITYI52pRYB2CoWtACGejj69vzTntyWLqXJnu9BvsJrdkEDLLIS
	0wlVFcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t78fr-00000009EOj-1KV2;
	Sat, 02 Nov 2024 07:35:55 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t78fn-00000009ENQ-43Sf
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 07:35:54 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6ce3fc4e58bso16490956d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730532950; x=1731137750; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ9qPT4X1y9JnxifLB5ReKQm3ANZL4+6NuAHEJVFpsk=;
        b=GGp3pn/VBY4MsjCtVIdOJ7n5KEWEKIZHMqvQEpH2+sZhkNPxBf+vXHg8D7ww9SE7ne
         b6L0/Q53lEoOBzTsLzZdJACnCfDcQZUCgeipXRgoeN9qL89tC3DXgXuuYCN1hIT4xbTR
         rlO04dbfslWDruaCvhAgBQLR/qDBALriSwBXVPGqNwZvp8GLmnDhFTgxhsff8Qz40/aK
         /4lshuX//x9DRgNl/ONe1iWo8jeOEW/dvfm7I2PTPlzXEF5sVMcEYX0+qyGg6FNM1OmI
         E5+DjMng/F7MFpVkcsG831AJMp1DC7Tx/k9xUbaJh6Abb6H3AYuY6O5NXisv4W5vMhLB
         BWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730532950; x=1731137750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ9qPT4X1y9JnxifLB5ReKQm3ANZL4+6NuAHEJVFpsk=;
        b=Jr6e8siKOfWzrCDbwE9BLV9y/KA4QRqJPzUCCkWSclEzzTN5N4mU80omISOwycaKSb
         ItKQhn7hRXJy5zm8+vNpq7vs7MPtiA1ZSEMMqsSvpmB5sGZKSeI8lW+zHjsH9ul2foI7
         rwcCOBog2M9O3/Pg4/Yn/75p+7xs6fSFNW6qUYqb56isv4VwfGE75XWS+yQQ5yzR9huo
         wX8MHLZZ4Wwvggg4XHkEfOHAzhZawAgz8+WY8fcIdy8BtZF3e5Fql7V6Tex6BGPzGQ+Q
         RUl5iJ9Fr/dsKdJ/QTxunGZ77aPNrjfgm+gKhx+DaqqXB+Xq4Yluzh94xRjwBmXVofvG
         fkww==
X-Forwarded-Encrypted: i=1; AJvYcCX32YJKOgApyZWjBxiMvDaOcrch1+95rbztcLVQkKt229EVkR1ZtRGcEMR4+kigZ5ifbpYydPRqnjO96g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWiRNJSZsO3PY2LtjVRRs5irVQn3+D4Z39bOZ+sTen4+OqK9EL
	6cSsFAr5Qp8WnSltihkDYKWXhNz6YFQ24EVg2fJYXWrgyRF1a/ZJDxt7t/PGbBhGG613TVhXQnm
	4e/Y/iPVDlglvkF8Nh6Dq4t6wASHqoRQ9V04m
X-Google-Smtp-Source: AGHT+IHUz45ItoR1nmaHd4gznB/gNgPKf4eAB6aqlka0kPvR/qumLPH9XGK3LKrtvFLqiVEn/M7d745AV4yWWS8sDrc=
X-Received: by 2002:a05:6214:3c9b:b0:6ce:1f00:ffcc with SMTP id
 6a1803df08f44-6d351b06955mr141171956d6.42.1730532949743; Sat, 02 Nov 2024
 00:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 2 Nov 2024 15:35:36 +0800
Message-ID: <CABVgOSm1cDcrsgYutooRG-ZLuzMypAO+ndNFyPy2w3_5B84TSQ@mail.gmail.com>
Subject: Re: [RFC v2 00/13] LKMM *generic* atomics in Rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, lkmm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_003552_048372_8DB717CA 
X-CRM114-Status: GOOD (  39.13  )
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
Content-Type: multipart/mixed; boundary="===============5114342057954761138=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5114342057954761138==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c801720625e919d7"

--000000000000c801720625e919d7
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2024 at 14:04, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Hi,
>
> This is another RFC version of LKMM atomics in Rust, you can find the
> previous versions:
>
> v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
> wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/
>
> I add a few more people Cced this time, so if you're curious about why
> we choose to implement LKMM atomics instead of using the Rust ones, you
> can find some explanation:
>
> * In my Kangrejos talk: https://lwn.net/Articles/993785/
> * In Linus' email: https://lore.kernel.org/rust-for-linux/CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com/
>
> This time, I try implementing a generic atomic type `Atomic<T>`, since
> Benno and Gary suggested last time, and also Rust standard library is
> also going to that direction [1].
>
> Honestly, a generic atomic type is still not quite necessary for myself,
> but here are a few reasons that it's useful:
>
> *       It's useful for type alias, for example, if you have:
>
>         type c_long = isize;
>
>         Then `Atomic<c_clong>` and `Atomic<isize>` is the same type,
>         this may make FFI code (mapping a C type to a Rust type or vice
>         versa) more readable.
>
> *       In kernel, we sometimes switch atomic to percpu for better
>         scalabity, percpu is naturally a generic type, because it can
>         have data that is larger than machine word size. Making atomic
>         generic ease the potential switching/refactoring.
>
> *       Generic atomics provide all the functionalities that non-generic
>         atomics could have.
>
> That said, currently "generic" is limited to a few types: the type must
> be the same size as atomic_t or atomic64_t, other than basic types, only
> #[repr(<basic types>)] struct can be used in a `Atomic<T>`.
>
> Also this is not a full feature set patchset, things like different
> arithmetic operations and bit operations are still missing, they can be
> either future work or for future versions.
>
> I included an RCU pointer implementation as one example of the usage, so
> a patch from Danilo is added, but I will drop it once his patch merged.
>
> This is based on today's rust-next, and I've run all kunit tests from
> the doc test on x86, arm64 and riscv.
>
> Feedbacks and comments are welcome! Thanks.
>
> Regards,
> Boqun
>
> [1]: https://github.com/rust-lang/rust/issues/130539
>

Thanks, Boqun.

I played around a bit with porting the blk-mq atomic code to this. As
neither an expert in Rust nor an expert in atomics, this is probably
both non-idiomatic and wrong, but unlike the `core` atomics, it
provides an Atomic::<u64> on 32-bit systems, which gets UML's 32-bit
build working again.

Diff below -- I'm not likely to have much time to work on this again
soon, so feel free to pick it up/fix it if it suits.

Thanks,
-- David

---
diff --git a/rust/kernel/block/mq/operations.rs
b/rust/kernel/block/mq/operations.rs
index 9ba7fdfeb4b2..822d64230e11 100644
--- a/rust/kernel/block/mq/operations.rs
+++ b/rust/kernel/block/mq/operations.rs
@@ -11,7 +11,8 @@
     error::{from_result, Result},
     types::ARef,
 };
-use core::{marker::PhantomData, sync::atomic::AtomicU64,
sync::atomic::Ordering};
+use core::marker::PhantomData;
+use kernel::sync::atomic::{Atomic, Relaxed};

 /// Implement this trait to interface blk-mq as block devices.
 ///
@@ -77,7 +78,7 @@ impl<T: Operations> OperationsVTable<T> {
         let request = unsafe { &*(*bd).rq.cast::<Request<T>>() };

         // One refcount for the ARef, one for being in flight
-        request.wrapper_ref().refcount().store(2, Ordering::Relaxed);
+        request.wrapper_ref().refcount().store(2, Relaxed);

         // SAFETY:
         //  - We own a refcount that we took above. We pass that to `ARef`.
@@ -186,7 +187,7 @@ impl<T: Operations> OperationsVTable<T> {

             // SAFETY: The refcount field is allocated but not initialized, so
             // it is valid for writes.
-            unsafe {
RequestDataWrapper::refcount_ptr(pdu.as_ptr()).write(AtomicU64::new(0))
};
+            unsafe {
RequestDataWrapper::refcount_ptr(pdu.as_ptr()).write(Atomic::<u64>::new(0))
};

             Ok(0)
         })
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 7943f43b9575..8d4060d65159 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -13,8 +13,8 @@
 use core::{
     marker::PhantomData,
     ptr::{addr_of_mut, NonNull},
-    sync::atomic::{AtomicU64, Ordering},
 };
+use kernel::sync::atomic::{Atomic, Relaxed};

 /// A wrapper around a blk-mq [`struct request`]. This represents an
IO request.
 ///
@@ -102,8 +102,7 @@ fn try_set_end(this: ARef<Self>) -> Result<*mut
bindings::request, ARef<Self>> {
         if let Err(_old) = this.wrapper_ref().refcount().compare_exchange(
             2,
             0,
-            Ordering::Relaxed,
-            Ordering::Relaxed,
+            Relaxed
         ) {
             return Err(this);
         }
@@ -168,13 +167,13 @@ pub(crate) struct RequestDataWrapper {
     /// - 0: The request is owned by C block layer.
     /// - 1: The request is owned by Rust abstractions but there are
no [`ARef`] references to it.
     /// - 2+: There are [`ARef`] references to the request.
-    refcount: AtomicU64,
+    refcount: Atomic::<u64>,
 }

 impl RequestDataWrapper {
     /// Return a reference to the refcount of the request that is embedding
     /// `self`.
-    pub(crate) fn refcount(&self) -> &AtomicU64 {
+    pub(crate) fn refcount(&self) -> &Atomic::<u64> {
         &self.refcount
     }

@@ -184,7 +183,7 @@ pub(crate) fn refcount(&self) -> &AtomicU64 {
     /// # Safety
     ///
     /// - `this` must point to a live allocation of at least the size
of `Self`.
-    pub(crate) unsafe fn refcount_ptr(this: *mut Self) -> *mut AtomicU64 {
+    pub(crate) unsafe fn refcount_ptr(this: *mut Self) -> *mut Atomic::<u64> {
         // SAFETY: Because of the safety requirements of this function, the
         // field projection is safe.
         unsafe { addr_of_mut!((*this).refcount) }
@@ -202,28 +201,22 @@ unsafe impl<T: Operations> Sync for Request<T> {}

 /// Store the result of `op(target.load())` in target, returning new value of
 /// target.
-fn atomic_relaxed_op_return(target: &AtomicU64, op: impl Fn(u64) ->
u64) -> u64 {
-    let old = target.fetch_update(Ordering::Relaxed,
Ordering::Relaxed, |x| Some(op(x)));
-
-    // SAFETY: Because the operation passed to `fetch_update` above always
-    // return `Some`, `old` will always be `Ok`.
-    let old = unsafe { old.unwrap_unchecked() };
-
-    op(old)
+fn atomic_relaxed_op_return(target: &Atomic::<u64>, op: impl Fn(u64)
-> u64) -> u64 {
+    let old = target.load(Relaxed);
+    let new_val = op(old);
+    target.compare_exchange(old, new_val, Relaxed);
+    old
 }

 /// Store the result of `op(target.load)` in `target` if `target.load() !=
 /// pred`, returning [`true`] if the target was updated.
-fn atomic_relaxed_op_unless(target: &AtomicU64, op: impl Fn(u64) ->
u64, pred: u64) -> bool {
-    target
-        .fetch_update(Ordering::Relaxed, Ordering::Relaxed, |x| {
-            if x == pred {
-                None
-            } else {
-                Some(op(x))
-            }
-        })
-        .is_ok()
+fn atomic_relaxed_op_unless(target: &Atomic::<u64>, op: impl Fn(u64)
-> u64, pred: u64) -> bool {
+    let old = target.load(Relaxed);
+    if old == pred {
+        false
+    } else {
+        target.compare_exchange(old, op(old), Relaxed).is_ok()
+    }
 }

 // SAFETY: All instances of `Request<T>` are reference counted. This

--000000000000c801720625e919d7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
erg7AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFKFQnbTpSq0q
cOYnlrbegXJIIvA6MFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBR
nRJBmUP+IpudtmSQ/R55Sv0qv8TO9zHTlIdsIf2Gc/zeCi0SamUQkFWb01d7Q+20kcpxNzwV6M7y
hDRk5uuVFvtVxOrmbhflCo0uBpD9vz/symtfJYZLNyvSDi1PIVrwGNpyRrD0W6VQJxzzsBTwsO+S
XWN3+x70+QDf7+zovW7KF0/y8QYD6PIN7Y9LRUXct0HKhatkHmO3w6MSJatnqSvsjffIwpNecUMo
h10c6Etz17b7tbGdxdxLw8njN+UnfoFp3v4irrafB6jkArRfsR5TscZUUKej0ihl7mXEKUBmClkP
ndcbXHFxS6WTkpjvl7Jjja8DdWJSJmdEWUnFjnQnDrqLqvYjeVMS/8IBF57eyT6yEPrMzA+Zd+f5
hnM7HuBSGvVHv+c/rlHVp0S364DBGXj11obl7nKgL9D59QwC5/kNJ1whoKwsATUSepanzALdOTn3
BavXUVE38e4c90il44T1bphqtLfmHZ1T5ZwxjtjzNMKy0Mb9j/jcFxfibCISYbnk661FBe38bhYj
0DhqINx2fw0bwhpfFGADOZDe5DVhI7AIW/kEMHuIgAJ/HPgyn1+tldOPWiFLQbTNNBnfGv9sDPz0
hWV2vSAXq35i+JS06BCkbGfE5ci6zFy4pt8fmqMGKFH/t3ELCTYo116lqUTDcVC8DAWN8E55aDGC
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAZ6Vqszmp/3gGFW0sCFu
eDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgF0vqo1HVFT/bQ7EkNDs2Hus8IOJB
l7ayh+mRl5TWm7kwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQx
MTAyMDczNTUwWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAKaR1ftvw40UB8q5VJnefq54/RCk1WTZ6iZ7N63ow3udHZuU
q8PXVid4CoTVbuyli8a9eYjBoNKkBZATNlXdZXu70UW0pL7ZT/szUD/ifDyYp0pG8L88xOorTU9/
/2OsBqCz7XqHuDXxNvISdtZGhS54eFTQOqpRDWJHL2SyKZYhKSfxJqK9aXFlM8NCigEEjREczx2w
cKGZOuV8BMwr+ASTA3re3nICdbGJ/9ZZdgjJx9e5Zuis/XNYgfioHfQmD+O1DuyDd5UAiWWmw+UL
Rrt/X/IJHkKWtelCwF83G1tCsLQbtsvvrshx3WycCCnILrjI7esiXDmQzsxzmLho1og=
--000000000000c801720625e919d7--


--===============5114342057954761138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5114342057954761138==--

